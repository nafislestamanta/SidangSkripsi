<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Diagnosa extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('M_diagnosa');
    }

    function index_post()
    {
        // inisiasi variabel yang akan diinput ke db
        $list_gejala = array();
        $list_penyakit = array();

        $input_gejala_kondisi = $this->post('list_jawaban');
        // var_dump($input_gejala_kondisi);
        // die;

        $list_jawaban = json_decode($input_gejala_kondisi);




        foreach ($list_jawaban as $jawaban) {
            // jika pengguna memilih kondisi dan tidak 0
            if (strlen($jawaban) > 1) {
                // * memecah id gejala dan id kondisi yang dipilih pengguna misal 16_1 menjadi array [16,1]
                $split_pilihan = explode('_', $jawaban);
                // var_dump(explode('_', $jawaban));

                // * menyimpan gejala dan kondisi yang dipilih pengguna kedalam list_gejala
                $list_gejala += array($split_pilihan[0] => $split_pilihan[1]);
            }
        }

        // ambil semua penyakit
        $semua_penyakit = $this->db->get('hamapenyakit')->result_array();

        // perulangan menghitung CF tiap penyakit
        foreach ($semua_penyakit as $penyakit) {

            // ambil semua basis pengetahuan dari penyakit saat ini berdasarkan id_penyakit
            $pengetahuan_terkait =  $this->db->get_where('basis_pengetahuan', ['kode_hp' => $penyakit['kode_hp']])->result_array();

            // inisiasi variabel CF untuk perhitungan
            $cf = 0;
            $cf_lama = 0;
            // ! perulangan menghitung CF[H,E] 1, CF[H,E] 2, dst
            // ! urutan untuk penanda urutan CF[H,E]
            $urutancf = 1;

            // hitung dan cek tiap pengetahuan terkait
            foreach ($pengetahuan_terkait as $pengetahuan) {

                // cek tiap gejala pada pengetahuan terkait
                foreach ($list_jawaban as $gejala) {
                    $gejala = explode("_", $gejala);



                    $cekValue = 0;

                    if ($gejala[1] == 1) {
                        $cekValue = 0.4;
                    } elseif ($gejala[1] == 2) {
                        $cekValue = 0.6;
                    } elseif ($gejala[1] == 3) {
                        $cekValue = 0.8;
                    } elseif ($gejala[1] == 4) {
                        $cekValue = 1;
                    }

                    // jika gejala pada pengetahuan sama dengan gejala yang diinput pengguna
                    if ($pengetahuan['kode_gejala'] == $gejala[0]) {

                        // ambil kondisi terpilih untuk mengakses cf_kondisi
                        // $kondisi_terpilih = $gejala[1];

                        // perhitungan rumus CF gejala iterasi saat ini
                        $cf = $pengetahuan['cf_pakar'] * $cekValue;



                        // iterasi pertama maka CF 1 langsung menjadi CF OLD
                        if ($urutancf <= 1) {
                            $cf_lama = $cf;
                        } else {

                            // ? selain iterasi pertama maka gunakan rumus perhitungan dengan cf lama sebelumnya (CF COMBINE)                                
                            $cf_lama = $cf_lama + ($cf * (1 - $cf_lama));
                        }

                        $urutancf++;
                    }
                }
            }
            if ($cf_lama > 0) {

                // jika nilai tidak negatif maka tambahkan ke daftar diagnosa
                // tambahkan penyakit ke daftar list jika sesuai gejala dan perhitungan
                $list_penyakit += array($penyakit['kode_hp'] => number_format($cf_lama, 4));
            }
        }

        // mengurutkan dari nilai tertinggi ke rendah
        arsort($list_penyakit);

        // tampilkan hasil perhitungan
        // $response['status'] = true;
        // $response['message'] = 'Berhasil dapat diagnosa';
        // $response['data'] = [
        //     'penyakit' => $penyakit,
        //     'solusi' => $solusi,
        // ];

        // $this->response($response);

        // return;

        $hasilpenyakit = $this->M_diagnosa->getHasilPenyakit($list_penyakit);
        $hasilgejala = $this->M_diagnosa->getHasilGejala($list_gejala);

        // input hasil perhitungan ke db
        if ($list_penyakit && $list_gejala) {
            $kode_hp = null;
            $nilai = null;
            $no = 1;



            foreach ($list_penyakit as $key => $value) {
                if ($no == 1) {
                    $kode_hp = $key;
                    $nilai = $value;
                }
                $no++;
            }

            $hamapenyakit = $this->db->get_where("hamapenyakit", ["kode_hp" => $kode_hp])->row_array();
            $solusi = $this->db->get_where("solusi", ["kode_hp" => $kode_hp])->result_array();


            $hasil = array(
                'kode_hp' => $kode_hp,
                'hasil_hp' => json_encode($list_penyakit),
                'hasil_gejala' => json_encode($list_gejala),
                'hasil_nilai' => $nilai
            );

            $hasil_json = array(
                'kode_hp' => $kode_hp,
                'hasil_hp' => $hasilpenyakit,
                'hasil_gejala' => $hasilgejala,
                'hasil_nilai' => $nilai,
                'hamapenyakit' => $hamapenyakit
            );

            $cek = $this->db->insert('diagnosa', $hasil);

            if ($cek) {
                $this->response(
                    array(
                        'status' => true,
                        'message' => 'berhasil menyimpan data',
                        'data' => $hasil_json,
                        // 'hamapenyakit' => $hamapenyakit,
                        'solusi' => $solusi,
                    ),
                    200
                );
            } else {
                $this->response(
                    array(
                        'status' => false,
                        'message' => 'gagal menyimpan data',
                    ),
                    200
                );
            }
        }

        // $cekValue = 0;

        // if ($gejala[1] == 1) {
        //     $cekValue = 0.4;
        // } elseif ($gejala[1] == 2) {
        //     $cekValue = 0.6;
        // } elseif ($gejala[1] == 3) {
        //     $cekValue = 0.8;
        // } elseif ($gejala[1] == 4) {
        //     $cekValue = 1;
        // }

        // $kodeGejala = $this->post('kodeGejala');
    }
}

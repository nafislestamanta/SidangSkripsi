<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class HamaPenyakit extends REST_Controller
{

    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data hama okra
    function index_get()
    {
        $id = $this->get('kode_hp');
        if ($id == '') {
            $this->db->where('kategori', 'Hama');
            $hamapenyakit = $this->db->get('hamapenyakit')->result();

            $this->response(
                array(
                    'status' => true,
                    'message' => 'berhasil mengambil data',
                    'data' => $hamapenyakit,
                ),
                200
            );
        } else {
            $solusi = $this->db->get_where("solusi", ["kode_hp" => $id])->result_array();
            $this->db->join('gejala', 'gejala.kode_gejala=basis_pengetahuan.kode_gejala');
            $pengetahuan = $this->db->get_where("basis_pengetahuan", ["kode_hp" => $id])->result_array();
            $this->response(
                array(
                    'status' => true,
                    'message' => 'berhasil mengambil data',
                    'pengetahuan' => $pengetahuan,
                    'solusi' => $solusi,
                ),
                200
            );
        }
    }

    //Menampilkan data penyakit okra
    function penyakit_get()
    {
        $id = $this->get('kode_hp');
        if ($id == '') {
            $this->db->where('kategori', 'Penyakit');
            $hamapenyakit = $this->db->get('hamapenyakit')->result();

            $this->response(
                array(
                    'status' => true,
                    'message' => 'berhasil mengambil data',
                    'data' => $hamapenyakit,
                ),
                200
            );
        } else {
            $solusi = $this->db->get_where("solusi", ["kode_hp" => $id])->result_array();
            $this->db->join('gejala', 'gejala.kode_gejala=basis_pengetahuan.kode_gejala');
            $pengetahuan = $this->db->get_where("basis_pengetahuan", ["kode_hp" => $id])->result_array();

            $this->response(
                array(
                    'status' => true,
                    'message' => 'berhasil mengambil data',
                    'pengetahuan' => $pengetahuan,
                    'solusi' => $solusi,
                ),
                200
            );
        }
    }


    //Menampilkan data gejala 
    function gejala_get()
    {
        $id = $this->get('kode_gejala');
        if ($id == '') {
            $gejala = $this->db->get('gejala')->result();

            $this->response(
                array(
                    'status' => true,
                    'message' => 'berhasil mengambil data',
                    'data' => $gejala,
                ),
                200
            );
        } else {
        }
    }
}

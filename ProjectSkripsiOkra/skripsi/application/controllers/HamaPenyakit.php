<?php
defined('BASEPATH') or exit('No direct script access allowed');

class HamaPenyakit extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_hamapenyakit');
        cek_login();
    }
    public function index()
    {
        $data['data'] = $this->M_hamapenyakit->tampilHP()->result();
        $data['title'] = 'Data Hama dan Penyakit';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('hamapenyakit/dataHP', $data);
        $this->load->view('templates/footer', $data);
    }

    public function tambahHP()
    {
        $data['data'] = $this->M_hamapenyakit->kode();
        $data['title'] = 'Data Hama dan Penyakit';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('hamapenyakit/tambahHP', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanHP()
    {
        $this->form_validation->set_rules('kategori', 'Kategori', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);
        // $this->form_validation->set_rules('namaLatin', 'NamaLatin', 'required|trim', [
        //     'required' => 'Field tidak boleh kosong'
        // ]);

        if ($this->form_validation->run() == false) {
            $this->tambahHP();
        } else {
            $kode = $this->input->post('kode');
            $kategori = $this->input->post('kategori');
            $nama = $this->input->post('nama');
            $namaLatin = $this->input->post('namaLatin');
            $gambar = $_FILES['gambar']['name'];

            $config['upload_path']      =    './assets/images/okra/';
            $config['allowed_types']    =    'jpg|jpeg|png';
            $config['max_size']         =    10000;

            $this->load->library('upload', $config);

            if ($gambar) {
                if ($this->upload->do_upload('gambar')) {

                    $data = [
                        'kode_hp' => $kode,
                        'kategori' => $kategori,
                        'nama_hp' => $nama,
                        'nama_latin' => $namaLatin,
                        'gambar' => preg_replace("/\s+/", "_", $gambar),
                    ];

                    $tambah = $this->M_hamapenyakit->tambahHP($data);

                    if ($tambah) {
                        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil ditambah</div>');
                        redirect('hamapenyakit');
                    } else {
                        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil ditambah</div>');
                        redirect('hamapenyakit');
                    }
                } else {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Gambar tidak sesuai format</div>');
                    redirect('hamapenyakit', $error);
                }
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data Gagal Ditambahkan, Harap Mengupload Gambar!</div>');
                redirect('hamapenyakit');
            }
        }
    }

    public function editHP($id)
    {
        $data['edit'] = $this->M_hamapenyakit->tampilEditHP($id)->row();
        $data['title'] = 'Data Hama dan Penyakit';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('hamapenyakit/editHP', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanEditHP($id)
    {
        $this->form_validation->set_rules('kategori', 'Kategori', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);

        if ($this->form_validation->run() == false) {
            $this->editHP($id);
        } else {
            $kategori = $this->input->post('kategori');
            $nama = $this->input->post('nama');
            $namaLatin = $this->input->post('namaLatin');
            $gambar = $_FILES['gambar']['name'];

            $config['upload_path']      =    './assets/images/okra/';
            $config['allowed_types']    =    'jpg|jpeg|png';
            $config['max_size']         =    10000;

            $this->load->library('upload', $config);

            if ($gambar) {
                if ($this->upload->do_upload('gambar')) {

                    $data = [
                        'kategori' => $kategori,
                        'nama_hp' => $nama,
                        'nama_latin' => $namaLatin,
                        'gambar' => preg_replace("/\s+/", "_", $gambar),
                    ];

                    $update = $this->M_hamapenyakit->updateHP($data, $id);

                    if ($update) {
                        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil diupdate</div>');
                        redirect('hamapenyakit');
                    } else {
                        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil diupdate</div>');
                        redirect('hamapenyakit');
                    }
                } else {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Gambar tidak sesuai format</div>');
                    redirect('hamapenyakit', $error);
                }
            } else {
                $data = [
                    'kategori' => $kategori,
                    'nama_hp' => $nama,
                    'nama_latin' => $namaLatin,
                ];

                $update = $this->M_hamapenyakit->updateHP($data, $id);

                if ($update) {
                    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil diupdate</div>');
                    redirect('hamapenyakit');
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil diupdate</div>');
                    redirect('hamapenyakit');
                }
            }
        }
    }

    public function detailHP($id)
    {
        $data['detail'] = $this->M_hamapenyakit->tampilEditHP($id)->row();
        $data['title'] = 'Data Hama dan Penyakit';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('hamapenyakit/detailHP', $data);
        $this->load->view('templates/footer', $data);
    }

    public function deleteHP($id)
    {
        $delete = $this->M_hamapenyakit->deleteHP($id);
        if ($delete) {
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil dihapus</div>');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data gagal dihapus</div>');
        }
        redirect('hamapenyakit');
    }
}

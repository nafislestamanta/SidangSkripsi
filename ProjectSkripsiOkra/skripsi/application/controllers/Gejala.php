<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Gejala extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_gejala');
        cek_login();
    }
    public function index()
    {
        $data['data'] = $this->M_gejala->tampilGejala()->result();
        $data['title'] = 'Data Gejala';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('gejala/dataGejala', $data);
        $this->load->view('templates/footer', $data);
    }

    public function tambahGejala()
    {
        $data['data'] = $this->M_gejala->kode();
        $data['title'] = 'Data Gejala';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('gejala/tambahGejala', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanGejala()
    {
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);

        if ($this->form_validation->run() == false) {
            $this->tambahGejala();
        } else {
            $kode = $this->input->post('kode');
            $nama = $this->input->post('nama');

            $data = [
                'kode_gejala' => $kode,
                'nama_gejala' => $nama,
            ];

            $tambah = $this->M_gejala->tambahGejala($data);

            if ($tambah) {
                $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil ditambah</div>');
                redirect('Gejala');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil ditambah</div>');
                redirect('Gejala');
            }
        }
    }

    public function editGejala($id)
    {
        $data['edit'] = $this->M_gejala->tampilEditGejala($id)->row();
        $data['title'] = 'Data Gejala';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('gejala/editGejala', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanEditGejala($id)
    {
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);

        if ($this->form_validation->run() == false) {
            $this->editGejala($id);
        } else {
            $nama = $this->input->post('nama');

            $data = [
                'nama_gejala' => $nama,
            ];

            $update = $this->M_gejala->updateGejala($data, $id);

            if ($update) {
                $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil diupdate</div>');
                redirect('Gejala');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil diupdate</div>');
                redirect('Gejala');
            }
        }
    }

    public function detailGejala($id)
    {
        $data['detail'] = $this->M_gejala->tampilEditGejala($id)->row();
        $data['title'] = 'Data Gejala';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('gejala/detailGejala', $data);
        $this->load->view('templates/footer', $data);
    }

    public function deleteGejala($id)
    {
        $delete = $this->M_gejala->deleteGejala($id);
        if ($delete) {
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil dihapus</div>');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data gagal dihapus</div>');
        }
        redirect('Gejala');
    }
}

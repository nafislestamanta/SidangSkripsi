<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Solusi extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_solusi');
        cek_login();
    }
    public function index()
    {
        $data['data'] = $this->M_solusi->tampilSolusi()->result();
        $data['title'] = 'Data Solusi';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('solusi/dataSolusi', $data);
        $this->load->view('templates/footer', $data);
    }

    public function tambahSolusi()
    {
        $data['data'] = $this->M_solusi->kode();
        $data['tampil'] = $this->M_solusi->tampilHP()->result();
        $data['title'] = 'Data Solusi';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('solusi/tambahSolusi', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanSolusi()
    {
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required' => 'Field tidak boleh kosong'
        ]);
        // $this->form_validation->set_rules('solusi', 'Solusi', 'required|trim', [
        //     'required' => 'Field tidak boleh kosong'
        // ]);

        if ($this->form_validation->run() == false) {
            $this->tambahSolusi();
        } else {
            $kode = $this->input->post('kode');
            $nama = $this->input->post('nama');
            $solusi = $this->input->post('solusi');
            $data = array();
            $data1 = array();
            // if (isset($_POST['solusi'])) {
            //     print_r($_POST['solusi']);
            // die();
            $i = 0;
            foreach ($solusi as $sapa) {
                // echo $sapa;
                $i++;
                $kod = $this->db->query('SELECT MAX(kode_solusi) AS kd_max FROM solusi')->row_array();
                $tmp = ((int)$kod['kd_max']) + $i;
                array_push($data, array(
                    // 'kode_solusi' => $tmp,
                    'solusi' => $sapa,
                    'kode_hp' => $nama,
                    'slug' => $kode
                ));

                // print_r($data);

                // array_push($data1, array(
                //     'kode_solusi' => $tmp,
                //     'kode_hp' => $nama,
                //     'slug' => $kode
                // ));
            }
            $tambah = $this->M_solusi->tambahSolusi($data);

            if ($tambah == "yeay") {
                $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil ditambah</div>');
                redirect('solusi');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil ditambah</div>');
                redirect('solusi');
            }
        }
    }

    public function editSolusi($id)
    {
        $data['edit'] = $this->M_solusi->tampilEditSolusi($id)->row();
        $data['edits'] = $this->M_solusi->tampilEditSolusi($id)->result();
        $data['tampil'] = $this->M_solusi->tampilHP()->result();
        $data['title'] = 'Data Solusi';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('solusi/editSolusi', $data);
        $this->load->view('templates/footer', $data);
    }

    public function simpanEditSolusi($id)
    {
        // $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
        //     'required' => 'Field tidak boleh kosong'
        // ]);
        // $this->form_validation->set_rules('solusi', 'Solusi', 'required|trim', [
        //     'required' => 'Field tidak boleh kosong'
        // ]);

        if ($this->form_validation->run() == false) {
            $this->editSolusi($id);
        } else {
            $kode_solusi = $this->input->post('kode_solusi');
            $solusi = $this->input->post('solusi');

            // $data = [
            //     'kode_solusi' => $kode_solusi,
            //     'solusi' => $solusi,
            // ];

            $data = array();
            $i = 0;
            foreach ($kode_solusi as $sapa) {
                $i++;
                array_push($data, array(
                    // 'kode_solusi' => $tmp,
                    'kode_solusi' => $sapa,
                ));
            }
            foreach ($solusi as $sapa2) {
                $i++;
                array_push($data, array(
                    // 'kode_solusi' => $tmp,
                    'solusi' => $sapa2,
                ));
            }

            $update = $this->M_solusi->updateSolusi($data, $id);

            if ($update) {
                $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil diupdate</div>');
                redirect('solusi');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak berhasil diupdate</div>');
                redirect('solusi');
            }
        }
    }

    public function detailSolusi($id)
    {
        $data['detail'] = $this->M_solusi->tampilEditSolusi($id)->row();
        $data['details'] = $this->M_solusi->tampilEditSolusi($id)->result();
        $data['title'] = 'Data Solusi';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('solusi/detailSolusi', $data);
        $this->load->view('templates/footer', $data);
    }

    public function deleteSolusi($id)
    {
        $delete = $this->M_solusi->deleteSolusi($id);

        if ($delete) {
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data berhasil dihapus</div>');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data gagal dihapus</div>');
        }
        redirect('solusi');
    }
}

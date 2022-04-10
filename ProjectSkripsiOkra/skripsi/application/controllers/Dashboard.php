<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_dashboard');
        cek_login();
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['hp'] = $this->M_dashboard->jmlh_HP()->row();
        $data['gejala'] = $this->M_dashboard->jmlh_gejala()->row();
        $data['bp'] = $this->M_dashboard->jmlh_pengetahuan()->row();
        $data['hasil'] = $this->M_dashboard->graph()->result();
        $data['hps'] = $this->M_dashboard->tampilHP()->row();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('dashboard', $data);
        $this->load->view('templates/footer', $data);
    }
}

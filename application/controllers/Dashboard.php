<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->layout->auth();
		$this->load->model(array('MSurat'));
		$this->load->model('View_surat_model');
		$this->load->model('View_jumlah_surat_model');
		$this->load->helper('dateina');
	}

	public function index()
	{
		$tahun = date('Y');
		$data['grafik'] = $this->View_jumlah_surat_model->get_all();
		$data['jml_surat_masuk'] = $this->MSurat->total_rows();
		$data['jml_surat_selesai'] = $this->MSurat->total_selesai();
		$data['jml_surat_diproses'] = $this->MSurat->total_diproses();
		$data['jml_surat_unread'] = $this->MSurat->total_unread();
		$data['title'] = 'Dashboard';
		$data['subtitle'] = '';
		$data['crumb'] = [
			'Dashboard' => '',
		];
		//$this->layout->set_privilege(1);
		$data['page'] = 'Dashboard/Index';
		$this->load->view('template/backend', $data);
	}
}

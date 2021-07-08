<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class View_jumlah_surat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth(); 
        $this->layout->auth_privilege($c_url);
        $this->load->model('View_jumlah_surat_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 'view_jumlah_surat?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'view_jumlah_surat?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'view_jumlah_surat';
            $config['first_url'] = base_url() . 'view_jumlah_surat';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->View_jumlah_surat_model->total_rows($q);
        $view_jumlah_surat = $this->View_jumlah_surat_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'view_jumlah_surat_data' => $view_jumlah_surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'View Jumlah Surat';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'View Jumlah Surat' => '',
        ];

        $data['page'] = 'view_jumlah_surat/view_jumlah_surat_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id) 
    {
        $row = $this->View_jumlah_surat_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_surat' => $row->id_surat,
		'tanggal' => $row->tanggal,
		'Jumlah_Surat' => $row->Jumlah_Surat,
	    );
        $data['title'] = 'View Jumlah Surat';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'view_jumlah_surat/view_jumlah_surat_read';
        $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('view_jumlah_surat'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('view_jumlah_surat/create_action'),
	    'id_surat' => set_value('id_surat'),
	    'tanggal' => set_value('tanggal'),
	    'Jumlah_Surat' => set_value('Jumlah_Surat'),
	);
        $data['title'] = 'View Jumlah Surat';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'view_jumlah_surat/view_jumlah_surat_form';
        $this->load->view('template/backend', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'id_surat' => $this->input->post('id_surat',TRUE),
		'tanggal' => $this->input->post('tanggal',TRUE),
		'Jumlah_Surat' => $this->input->post('Jumlah_Surat',TRUE),
	    );

            $this->View_jumlah_surat_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('view_jumlah_surat'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->View_jumlah_surat_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('view_jumlah_surat/update_action'),
		'id_surat' => set_value('id_surat', $row->id_surat),
		'tanggal' => set_value('tanggal', $row->tanggal),
		'Jumlah_Surat' => set_value('Jumlah_Surat', $row->Jumlah_Surat),
	    );
            $data['title'] = 'View Jumlah Surat';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'view_jumlah_surat/view_jumlah_surat_form';
        $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('view_jumlah_surat'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('', TRUE));
        } else {
            $data = array(
		'id_surat' => $this->input->post('id_surat',TRUE),
		'tanggal' => $this->input->post('tanggal',TRUE),
		'Jumlah_Surat' => $this->input->post('Jumlah_Surat',TRUE),
	    );

            $this->View_jumlah_surat_model->update($this->input->post('', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('view_jumlah_surat'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->View_jumlah_surat_model->get_by_id($id);

        if ($row) {
            $this->View_jumlah_surat_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('view_jumlah_surat'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('view_jumlah_surat'));
        }
    }

    public function deletebulk(){
        $delete = $this->View_jumlah_surat_model->deletebulk();
        if($delete){
            $this->session->set_flashdata('message', 'Delete Record Success');
        }else{
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }
   
    public function _rules() 
    {
	$this->form_validation->set_rules('id_surat', 'id surat', 'trim|required');
	$this->form_validation->set_rules('tanggal', 'tanggal', 'trim|required');
	$this->form_validation->set_rules('Jumlah_Surat', 'jumlah surat', 'trim|required');

	$this->form_validation->set_rules('', '', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "view_jumlah_surat.xls";
        $judul = "view_jumlah_surat";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Id Surat");
	xlsWriteLabel($tablehead, $kolomhead++, "Tanggal");
	xlsWriteLabel($tablehead, $kolomhead++, "Jumlah Surat");

	foreach ($this->View_jumlah_surat_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteNumber($tablebody, $kolombody++, $data->id_surat);
	    xlsWriteLabel($tablebody, $kolombody++, $data->tanggal);
	    xlsWriteLabel($tablebody, $kolombody++, $data->Jumlah_Surat);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=view_jumlah_surat.doc");

        $data = array(
            'view_jumlah_surat_data' => $this->View_jumlah_surat_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('view_jumlah_surat/view_jumlah_surat_doc',$data);
    }

  public function printdoc(){
        $data = array(
            'view_jumlah_surat_data' => $this->View_jumlah_surat_model->get_all(),
            'start' => 0
        );
        $this->load->view('view_jumlah_surat/view_jumlah_surat_print', $data);
    }

}

/* End of file View_jumlah_surat.php */
/* Location: ./application/controllers/View_jumlah_surat.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2021-07-07 12:48:13 */
/* http://harviacode.com */
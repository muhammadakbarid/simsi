<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tujuan extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth();
        $this->layout->auth_privilege($c_url);
        $this->load->model('MTujuan');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'tujuan?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'tujuan?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'tujuan';
            $config['first_url'] = base_url() . 'tujuan';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MTujuan->total_rows($q);
        $tujuan = $this->MTujuan->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tujuan_data' => $tujuan,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Tujuan';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Tujuan' => '',
        ];

        $data['page'] = 'tujuan/tujuan_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id)
    {
        $row = $this->MTujuan->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'id_surat' => $row->id_surat,
                'dari' => $row->dari,
                'kepada' => $row->kepada,
                'post_date' => $row->post_date,
                'status' => $row->status,
            );
            $data['title'] = 'Tujuan';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'tujuan/tujuan_read';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('tujuan'));
        }
    }

    public function create()
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tujuan/create_action'),
            'id' => set_value('id'),
            'id_surat' => set_value('id_surat'),
            'dari' => set_value('dari'),
            'kepada' => set_value('kepada'),
            'post_date' => set_value('post_date'),
            'status' => set_value('status'),
        );
        $data['title'] = 'Tujuan';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'tujuan/tujuan_form';
        $this->load->view('template/backend', $data);
    }

    public function create_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'id_surat' => $this->input->post('id_surat', TRUE),
                'dari' => $this->input->post('dari', TRUE),
                'kepada' => $this->input->post('kepada', TRUE),
                'post_date' => $this->input->post('post_date', TRUE),
                'status' => $this->input->post('status', TRUE),
            );

            $this->MTujuan->insert($data);
            $this->session->set_flashdata('success', 'Create Record Success');
            redirect(site_url('tujuan'));
        }
    }

    public function update($id)
    {
        $row = $this->MTujuan->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tujuan/update_action'),
                'id' => set_value('id', $row->id),
                'id_surat' => set_value('id_surat', $row->id_surat),
                'dari' => set_value('dari', $row->dari),
                'kepada' => set_value('kepada', $row->kepada),
                'post_date' => set_value('post_date', $row->post_date),
                'status' => set_value('status', $row->status),
            );
            $data['title'] = 'Tujuan';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'tujuan/tujuan_form';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('tujuan'));
        }
    }

    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'id_surat' => $this->input->post('id_surat', TRUE),
                'dari' => $this->input->post('dari', TRUE),
                'kepada' => $this->input->post('kepada', TRUE),
                'post_date' => $this->input->post('post_date', TRUE),
                'status' => $this->input->post('status', TRUE),
            );

            $this->MTujuan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('success', 'Update Record Success');
            redirect(site_url('tujuan'));
        }
    }



    public function delete($id)
    {
        $row = $this->MTujuan->get_by_id($id);

        if ($row) {
            $this->MTujuan->delete($id);
            $this->session->set_flashdata('success', 'Delete Record Success');
            redirect(site_url('tujuan'));
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('tujuan'));
        }
    }

    public function deletebulk()
    {
        $delete = $this->MTujuan->deletebulk();
        if ($delete) {
            $this->session->set_flashdata('success', 'Delete Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }

    public function _rules()
    {
        $this->form_validation->set_rules('id_surat', 'id surat', 'trim|required');
        $this->form_validation->set_rules('dari', 'dari', 'trim|required');
        $this->form_validation->set_rules('kepada', 'kepada', 'trim|required');
        $this->form_validation->set_rules('post_date', 'post date', 'trim|required');
        $this->form_validation->set_rules('status', 'status', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
}

/* End of file Tujuan.php */
/* Location: ./application/controllers/Tujuan.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:49 */
/* http://harviacode.com */
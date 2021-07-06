<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class SuratLampiran extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth();
        $this->layout->auth_privilege($c_url);
        $this->load->model('MSuratLampiran');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'suratlampiran?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'suratlampiran?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'suratlampiran';
            $config['first_url'] = base_url() . 'suratlampiran';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSuratLampiran->total_rows($q);
        $suratlampiran = $this->MSuratLampiran->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'suratlampiran_data' => $suratlampiran,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Suratlampiran';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Suratlampiran' => '',
        ];

        $data['page'] = 'suratlampiran/surat_lampiran_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id)
    {
        $row = $this->MSuratLampiran->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'id_tujuan' => $row->id_tujuan,
                'file_surat' => $row->file_surat,
            );
            $data['title'] = 'Suratlampiran';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'suratlampiran/surat_lampiran_read';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('suratlampiran'));
        }
    }

    public function create()
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('suratlampiran/create_action'),
            'id' => set_value('id'),
            'id_tujuan' => set_value('id_tujuan'),
            'file_surat' => set_value('file_surat'),
        );
        $data['title'] = 'Suratlampiran';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'suratlampiran/surat_lampiran_form';
        $this->load->view('template/backend', $data);
    }

    public function create_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'id_tujuan' => $this->input->post('id_tujuan', TRUE),
                'file_surat' => $this->input->post('file_surat', TRUE),
            );

            $this->MSuratLampiran->insert($data);
            $this->session->set_flashdata('success', 'Create Record Success');
            redirect(site_url('suratlampiran'));
        }
    }

    public function update($id)
    {
        $row = $this->MSuratLampiran->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('suratlampiran/update_action'),
                'id' => set_value('id', $row->id),
                'id_tujuan' => set_value('id_tujuan', $row->id_tujuan),
                'file_surat' => set_value('file_surat', $row->file_surat),
            );
            $data['title'] = 'Suratlampiran';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'suratlampiran/surat_lampiran_form';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('suratlampiran'));
        }
    }

    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'id_tujuan' => $this->input->post('id_tujuan', TRUE),
                'file_surat' => $this->input->post('file_surat', TRUE),
            );

            $this->MSuratLampiran->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('success', 'Update Record Success');
            redirect(site_url('suratlampiran'));
        }
    }

    public function delete($id)
    {
        $row = $this->MSuratLampiran->get_by_id($id);

        if ($row) {
            $this->MSuratLampiran->delete($id);
            $this->session->set_flashdata('success', 'Delete Record Success');
            redirect(site_url('suratlampiran'));
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('suratlampiran'));
        }
    }

    public function deletebulk()
    {
        $delete = $this->MSuratLampiran->deletebulk();
        if ($delete) {
            $this->session->set_flashdata('success', 'Delete Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }

    public function _rules()
    {
        $this->form_validation->set_rules('id_tujuan', 'id tujuan', 'trim|required');
        $this->form_validation->set_rules('file_surat', 'file surat', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
}

/* End of file SuratLampiran.php */
/* Location: ./application/controllers/SuratLampiran.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:29 */
/* http://harviacode.com */
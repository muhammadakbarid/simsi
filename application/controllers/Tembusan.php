<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tembusan extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth();
        $this->layout->auth_privilege($c_url);
        $this->load->model(array('MSurat', 'Users_model', 'MTujuan', 'MTembusan', 'MSuratLampiran', 'Permission_model'));
        $this->load->library('form_validation');
        $this->load->helper('dateina');
    }




    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'tembusan?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'tembusan?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'tembusan';
            $config['first_url'] = base_url() . 'tembusan';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MTembusan->total_rows($q);
        $tembusan = $this->MTembusan->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tembusan_data' => $tembusan,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Tembusan';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'tembusan' => '',
        ];
        $data['search_page'] = 'surat/tembusan';
        $data['page'] = 'tembusan/tembusan_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id)
    {
        $row = $this->MSurat->get_by_id($id);

        $id_user_surat = $this->session->userdata('user_id');
        $status_surat = $this->MTujuan->get_status_tujuan($id, $id_user_surat);

        // cek penerima tembusan sesuai dengan tujuan
        if (!$this->MSurat->cek_penerima_tembusan($id, $this->session->userdata('user_id'))) {
            $this->session->set_flashdata('error', 'Surat tidak ditemukan!');
            redirect(site_url('surat'));
            exit;
        }

        if ($row) {
            $data = array(
                'id' => $row->id,
                'tanggal' => $row->tanggal,
                'nomor_surat' => $row->nomor_surat,
                'lampiran' => $row->lampiran,
                'perihal' => $row->perihal,
                'nomor_agenda' => $row->nomor_agenda,
                'tgl_agenda' => $row->tgl_agenda,
                'post_date' => $row->post_date,
                'status' => $row->status,
                'post_tanggal' => substr($row->post_date, 0, 10),
                'post_waktu' => substr($row->post_date, 10)

            );

            if ($status_surat) {
                if ($status_surat->status == '0') {
                    $data_status_tujuan = array(
                        'status' => '1',
                    );
                    $this->MTujuan->update_status($id, $data_status_tujuan, $id_user_surat);
                }
            }
            $data['status_surat'] = $status_surat;
            $data['list_user'] = $this->Users_model->get_all();
            // $x=$data['timeline']['dari'];
            // $data['list_user'] = $this->Users_model->get_all();
            $data['timeline'] = $this->MSurat->get_timeline($id);
            // $data['visibility'] = $this->MSurat->get_visibility($id);
            $data['timeline_get_kepada'] = $this->MSurat->get_timeline_user2();
            $data['timeline_u'] = $this->MSurat->get_timeline_user($id);
            $data['timeline_l'] = $this->MTujuan->get_timeline_l($id);

            $data['kepada'] = $this->MTujuan->kepada_surat($id);
            $data['kepada_tembusan'] = $this->MTembusan->kepada_tembusan($id);


            $data['title'] = 'Surat';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'tembusan/tembusan_read';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('surat'));
        }
    }

    public function create()
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tembusan/create_action'),
            'id' => set_value('id'),
            'id_surat' => set_value('id_surat'),
            'kepada' => set_value('kepada'),
        );
        $data['title'] = 'Tembusan';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['page'] = 'tembusan/tembusan_form';
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
                'kepada' => $this->input->post('kepada', TRUE),
            );

            $this->MTembusan->insert($data);
            $this->session->set_flashdata('success', 'Create Record Success');
            redirect(site_url('tembusan'));
        }
    }

    public function update($id)
    {
        $row = $this->MTembusan->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tembusan/update_action'),
                'id' => set_value('id', $row->id),
                'id_surat' => set_value('id_surat', $row->id_surat),
                'kepada' => set_value('kepada', $row->kepada),
            );
            $data['title'] = 'Tembusan';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'tembusan/tembusan_form';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('tembusan'));
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
                'kepada' => $this->input->post('kepada', TRUE),
            );

            $this->MTembusan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('success', 'Update Record Success');
            redirect(site_url('tembusan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MTembusan->get_by_id($id);

        if ($row) {
            $this->MTembusan->delete($id);
            $this->session->set_flashdata('success', 'Delete Record Success');
            redirect(site_url('tembusan'));
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('tembusan'));
        }
    }

    public function deletebulk()
    {
        $delete = $this->MTembusan->deletebulk();
        if ($delete) {
            $this->session->set_flashdata('success', 'Delete Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }

    public function _rules()
    {
        $this->form_validation->set_rules('id_surat', 'id user', 'trim|required');
        $this->form_validation->set_rules('kepada', 'kepada', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
}

/* End of file Tembusan.php */
/* Location: ./application/controllers/Tembusan.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:40 */
/* http://harviacode.com */
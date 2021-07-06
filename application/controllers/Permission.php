<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Permission extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth();
        $this->layout->auth_privilege($c_url);
        $this->load->model('Permission_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'permission?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'permission?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'permission';
            $config['first_url'] = base_url() . 'permission';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->Permission_model->total_rows($q);
        $permission = $this->Permission_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'permission_data' => $permission,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Permission';
        $data['subtitle'] = '';

        $data['crumb'] = [
            'Permission' => '',
        ];

        $data['page'] = 'permission/permission_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id)
    {
        $row = $this->Permission_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'id_groups' => $row->id_groups,
                'id_groups_to' => $row->id_groups_to,
            );
            $data['title'] = 'Permission';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'permission/permission_read';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('permission'));
        }
    }

    public function create()
    {

        $data = array(
            'button' => 'Create',
            'action' => site_url('permission/create_action'),
            'id' => set_value('id'),
            'id_groups' => set_value('id_groups'),
            'id_groups_to' => set_value('id_groups_to'),
        );
        $data['title'] = 'Permission';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];

        $data['users_groups'] = $this->db->get('groups')->result_array();

        $data['page'] = 'permission/permission_form';
        $this->load->view('template/backend', $data);
    }

    public function create_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'id_groups' => $this->input->post('id_groups', TRUE),
                'id_groups_to' => $this->input->post('id_groups_to', TRUE),
            );

            $this->Permission_model->insert($data);
            $this->session->set_flashdata('success', 'Create Record Success');
            redirect(site_url('permission'));
        }
    }

    public function update($id)
    {
        $row = $this->Permission_model->get_by_id($id);


        if ($row) {
            $users_groups = $this->db->get('groups')->result_array();
            $data = array(
                'users_groups' => $users_groups,
                'button' => 'Update',
                'action' => site_url('permission/update_action'),
                'id' => set_value('id', $row->id),
                'id_groups' => set_value('id_groups', $row->id_groups),
                'id_groups_to' => set_value('id_groups_to', $row->id_groups_to),
            );
            $data['title'] = 'Permission';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'permission/permission_form';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('permission'));
        }
    }

    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'id_groups' => $this->input->post('id_groups', TRUE),
                'id_groups_to' => $this->input->post('id_groups_to', TRUE),
            );

            $this->Permission_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('success', 'Update Record Success');
            redirect(site_url('permission'));
        }
    }

    public function delete($id)
    {
        $row = $this->Permission_model->get_by_id($id);

        if ($row) {
            $this->Permission_model->delete($id);
            $this->session->set_flashdata('success', 'Delete Record Success');
            redirect(site_url('permission'));
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('permission'));
        }
    }

    public function deletebulk()
    {
        $delete = $this->Permission_model->deletebulk();
        if ($delete) {
            $this->session->set_flashdata('success', 'Delete Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }

    public function _rules()
    {
        $this->form_validation->set_rules('id_groups', 'id groups', 'trim|required');
        $this->form_validation->set_rules('id_groups_to', 'id groups to', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
}

/* End of file Permission.php */
/* Location: ./application/controllers/Permission.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 06:19:24 */
/* http://harviacode.com */
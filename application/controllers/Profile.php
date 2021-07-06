<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Profile extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->layout->auth();
		$data['crumb'] = [
			'Profile' => '',
		];
	}

	public function index()
	{

		$data['crumb'] = [
			'Profile' => ''
		];
		$this->load->model('users_model');
		$data['user'] = $this->db->get_where('users', ['email' => $this->session->userdata('email')])->row_array();
		$data['email'] = $this->session->userdata('email');
		$data['subtitle'] = '';

		$user_id = $this->session->userdata('user_id');
		$data['usergroups'] = $this->users_model->getUserGroups($user_id);


		$data['title'] = 'Profile';

		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
		$this->form_validation->set_rules('first_name', 'Nama Awal', 'required|trim');
		$this->form_validation->set_rules('last_name', 'Nama Akhir', 'required|trim');

		if ($this->form_validation->run() == false) {
			$data['page'] = 'profile';
			$this->load->view('template/backend', $data);
		} else {
			$first_name = $this->input->post('first_name');
			$last_name = $this->input->post('last_name');
			$email = $this->input->post('email');

			//cek jika ada gambar yang akan diupload
			$upload_image = $_FILES['image']['name'];

			if ($upload_image) {
				$config['upload_path'] = './assets/uploads/image/profile/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']     = '2048';

				$this->load->library('upload', $config);

				if ($this->upload->do_upload('image')) {

					$old_image = $data['user']['image'];
					if ($old_image != 'default.jpg') {
						unlink(FCPATH . 'assets/uploads/image/profile/' . $old_image);
					}

					$new_image = $this->upload->data('file_name');
					$this->db->set('image', $new_image);
				} else {
					$this->session->set_flashdata('success', '<div class="alert alert-danger" role="alert">' . $this->upload->display_errors() . '</div>');
					redirect('profile');
				}
			}

			$this->db->set('email', $email);
			$this->db->set('first_name', $first_name);
			$this->db->set('last_name', $last_name);
			$this->db->where('email', $email);
			$this->db->update('users');

			$this->session->set_flashdata('success', '<div class="alert alert-success" role="alert">Your profile hass been updated!</div>');
			redirect('profile');
		}
	}
}

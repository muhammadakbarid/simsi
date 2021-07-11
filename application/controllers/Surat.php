<?php

use phpDocumentor\Reflection\Types\Null_;

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Surat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $c_url = $this->router->fetch_class();
        $this->layout->auth();
        $this->layout->auth_privilege($c_url);
        $this->load->model(array('MSurat', 'Users_model', 'MTujuan', 'MTembusan', 'MSuratLampiran', 'Permission_model'));
        $this->load->library('form_validation');
        $this->load->helper(array('dateina', 'whatsapp'));
    }

    public function index()
    {

        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat';
            $config['first_url'] = base_url() . 'surat';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_rows($q);
        $surat = $this->MSurat->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Internal';
        $data['subtitle'] = 'Surat Masuk';

        $data['search_page'] = 'surat/index';
        $data['crumb'] = [
            'Surat' => '',
        ];

        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }
    public function eksternal()
    {

        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat';
            $config['first_url'] = base_url() . 'surat';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_rows_eksternal($q);
        $surat = $this->MSurat->get_limit_data_eksternal($config['per_page'], $start, $q);
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Eksternal';
        $data['subtitle'] = 'Surat Eksternal';

        $data['search_page'] = 'surat/index';
        $data['crumb'] = [
            'Surat' => '',
        ];

        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }
    public function selesai()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/selesai?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/selesai?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/selesai';
            $config['first_url'] = base_url() . 'surat/selesai';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_selesai($q);
        $surat = $this->MSurat->list_selesai($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Internal';
        $data['subtitle'] = 'Selesai';
        $data['crumb'] = [
            'Surat' => '',
        ];
        $data['search_page'] = 'surat/selesai';


        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }
    public function diproses()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/diproses?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/diproses?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/diproses';
            $config['first_url'] = base_url() . 'surat/diproses';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_diproses($q);
        $surat = $this->MSurat->list_diproses($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Internal';
        $data['subtitle'] = 'Sedang Diproses';
        $data['crumb'] = [
            'Surat' => '',
        ];
        $data['search_page'] = 'surat/diproses';
        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }
    public function unread()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/unread?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/unread?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/unread';
            $config['first_url'] = base_url() . 'surat/unread';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_unread($q);
        $surat = $this->MSurat->list_unread($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Internal';
        $data['subtitle'] = 'Belum Dibaca';
        $data['crumb'] = [
            'Surat' => '',
        ];
        $data['search_page'] = 'surat/unread';
        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }

    public function terkirim()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/terkirim?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/terkirim?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/terkirim';
            $config['first_url'] = base_url() . 'surat/terkirim';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->MSurat->total_terkirim($q);
        $surat = $this->MSurat->get_surat_terkirim($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Surat Internal';
        $data['subtitle'] = 'Surat Terkirim';
        $data['crumb'] = [
            'Surat' => '',
        ];
        $data['search_page'] = 'surat/terkirim';
        $data['page'] = 'surat/surat_list';
        $this->load->view('template/backend', $data);
    }

    public function read($id)
    {
        $row = $this->MSurat->get_by_id($id);

        $id_user_surat = $this->session->userdata('user_id');
        $status_surat = $this->MTujuan->get_status_tujuan($id, $id_user_surat);



        // cek penerima surat sesuai dengan tujuan
        if (!$this->MSurat->cek_penerima_surat($id, $this->session->userdata('user_id'))) {
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


            $data['status_tombol'] = $this->MTujuan->cekstatusproggressall($id);

            if ($status_surat) {
                if ($status_surat->status == '0') {
                    $data_status_tujuan = array(
                        'status' => '1',
                    );
                    $this->MTujuan->update_status($id, $data_status_tujuan, $id_user_surat);
                }
            }
            $data['status_surat'] = $status_surat;
            $status_progress = $this->MTujuan->get_status_progress($id);
            if ($status_progress == "0") {

                $data['status_progress'] = "0";
            } else {
                $status_progressx = $status_progress->status_progress;
                $data['status_progress'] = $status_progressx;
            }
            $data['list_user'] = $this->Users_model->get_all();
            // $x=$data['timeline']['dari'];
            // $data['list_user'] = $this->Users_model->get_all();
            $data['timeline'] = $this->MSurat->get_timeline($id);
            // $data['visibility'] = $this->MSurat->get_visibility($id);
            $data['timeline_get_kepada'] = $this->MSurat->get_timeline_user2();
            $data['timeline_u'] = $this->MSurat->get_timeline_user($id);
            $data['timeline_l'] = $this->MTujuan->get_timeline_l($id);
            $data['pengirim'] = $this->MSurat->get_timeline_print($id);
            $data['kepada'] = $this->MTujuan->kepada_surat($id);

            $data['kepada_tembusan'] = $this->MTembusan->kepada_tembusan($id);

            $data['title'] = 'Surat Internal';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'surat/surat_read';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Surat tidak ditemukan!');
            redirect(site_url('surat'));
        }
    }

    public function read_action()
    {
        $this->_rules2();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {

            $jumlahData = count($_FILES['attachment']['name']);
            // Insert ke tabel surat 
            $id_surat = $this->input->post('id', TRUE);

            $no_agenda = $this->MSurat->get_no_agenda($id_surat);
            // Masukan ke tabel tujuan
            if ($id_surat) {
                // cek array tujuan/kepada lebih dari satu? dalam bentuk array
                $kepada = $this->input->post('kepada');
                $nomor_surat = $this->input->post('nomor_surat', TRUE);
                if ($kepada) {
                    foreach ($kepada as $key => $value) {
                        $data_tujuan = array(
                            'dari' => $this->session->userdata('user_id'), // dari user id yang login
                            'kepada' => $value,
                            'id_surat' => $this->input->post('id', TRUE),
                            'isi' => $this->input->post('isi_surat', TRUE),
                            'note' => $nomor_surat
                        );
                        if ($no_agenda) {
                            $data_tujuan['visibility'] = "0";
                        } else {
                            $data_tujuan['visibility'] = "1";
                        }
                        $id_tujuan = $this->MTujuan->insert($data_tujuan);

                        $perihal_surat = $this->MSurat->get_perihal_surat($id_surat);
                        // Kirim notifikasi Whatsapp saat membalas surat
                        $user_pengirim = $this->ion_auth->user()->row();
                        $user_penerima = $this->ion_auth->user($value)->row();
                        $no_hp = $user_penerima->phone;
                        $dari = $user_pengirim->first_name . ' ' . $user_pengirim->last_name;
                        $perihal = $perihal_surat->perihal;
                        $link = base_url('surat/read/') . $id_surat;

                        whatsapp($no_hp, $dari, $perihal, $link);

                        reset($data_tujuan);
                    }
                }

                $data_status_tujuan = array(
                    'status' => '0',
                );
                $this->MTujuan->update_status2($id_surat, $data_status_tujuan);
                // cek file apakah upload file atau tidak
                // Hitung Jumlah File/Gambar yang dipilih
                $dataLampiran = NULL;
                if (!empty($_FILES['attachment']['name'])) {
                    for ($i = 0; $i < $jumlahData; $i++) :
                        // Inisi_suratalisasi Nama,Tipe,Dll.
                        $_FILES['file']['name']     = $_FILES['attachment']['name'][$i];
                        $_FILES['file']['type']     = $_FILES['attachment']['type'][$i];
                        $_FILES['file']['tmp_name'] = $_FILES['attachment']['tmp_name'][$i];
                        $_FILES['file']['size']     = $_FILES['attachment']['size'][$i];
                        $config['upload_path']   = './upload/surat-internal/';
                        $config['allowed_types'] = 'jpg|png|doc|docx|xls|xlsx|pdf|zip|rar|ppt|pptx';
                        // Memanggil Library Upload dan Setting Konfigurasi
                        $this->load->library('upload', $config);
                        $this->upload->initialize($config);
                        if ($this->upload->do_upload('file')) { // Jika Berhasil Upload
                            $fileData = $this->upload->data(); // Lakukan Upload Data
                            // Membuat Variable untuk dimasukkan ke Database
                            $dataLampiran[$i]['file_surat'] = $fileData['file_name'];
                            $dataLampiran[$i]['id_surat'] = $id_surat;
                            $dataLampiran[$i]['id_tujuan'] = $id_tujuan;
                        }
                    endfor; // Penutup For               
                    if ($dataLampiran !== null) { // Jika Berhasil Upload

                        // Insert ke Database 
                        $this->MSuratLampiran->upload($dataLampiran);
                    }
                }
                $this->session->set_flashdata('success', 'Surat berhasil terkirim.');
                redirect(site_url('surat/read/') . $id_surat);
            } else {
                // jika gagal masuk ke tabel
                $this->session->set_flashdata('error', 'Surat Gagal Terkirim!');
                redirect(site_url('surat/read/') . $id_surat);
            }
        }
    }
    public function agenda_action()
    {
        $this->_rules_agenda();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $id_surat = $this->input->post('id', TRUE);

            // Masukan ke tabel tujuan
            if ($id_surat) {
                // cek array tujuan/kepada lebih dari satu? dalam bentuk array
                $kepada = $this->input->post('kepada_agenda');
                if ($kepada) {

                    $data_tujuan = array(
                        'dari' => $this->session->userdata('user_id'), // dari user id yang login
                        'kepada' => $kepada,
                        'id_surat' => $id_surat,
                        'isi' => "<div class='alert alert-success'><i class='fa fa-check'></i> Surat telah diagendakan.</div>",
                        'visibility' => "1"
                    );
                    $data = array(
                        'nomor_agenda' => $this->input->post('no_agenda', TRUE), // dari user id yang login
                        'tgl_agenda' => date('Y-m-d'),
                    );
                    $data_filter = array(
                        'visibility' => '1'
                    );

                    // $arr_id = array('133', '134', '135');
                    $arr_id = $this->input->post('filter_surat');
                    if ($arr_id) {

                        $this->MTujuan->insert($data_tujuan);
                        $this->MSurat->update($id_surat, $data);
                        $this->MTujuan->updatebulk($data_filter, $arr_id);
                        $perihal_surat = $this->MSurat->get_perihal_surat($id_surat);
                        // Kirim notifikasi Whatsapp saat membalas surat
                        $user_pengirim = $this->ion_auth->user()->row();
                        $user_penerima = $this->ion_auth->user($kepada)->row();
                        $no_hp = $user_penerima->phone;
                        $dari = $user_pengirim->first_name . ' ' . $user_pengirim->last_name;
                        $perihal = $perihal_surat->perihal;
                        $link = base_url('surat/read/') . $id_surat;

                        whatsapp($no_hp, $dari, $perihal, $link);
                        redirect(site_url('surat/read/') . $id_surat);
                    } else {
                        $this->session->set_flashdata('error', 'Agenda Gagal Terkirim! Harap Centang Surat yang ingin ditampilkan!');
                        redirect(site_url('surat/read/') . $id_surat);
                    }
                } else {
                    $this->session->set_flashdata('error', 'Agenda Gagal Terkirim!');
                    redirect(site_url('surat/read/') . $id_surat);
                }
            } else {
                // jika gagal masuk ke tabel
                $this->session->set_flashdata('error', 'Agenda Gagal Terkirim!');
                redirect(site_url('surat/read/') . $id_surat);
            }
        }
    }
    public function disposisi()
    {
        // $this->_rules_agenda();


        $id_surat = $this->input->post('id', TRUE);

        // Masukan ke tabel tujuan
        if ($id_surat) {
            // cek array tujuan/kepada lebih dari satu? dalam bentuk array
            $kepada = $this->input->post('kepada_disposisi');
            $isi = $this->input->post('catatan');
            if ($kepada) {

                $data_tujuan = array(
                    'dari' => $this->session->userdata('user_id'), // dari user id yang login
                    'kepada' => $kepada,
                    'id_surat' => $id_surat,
                    'isi' => $isi,
                    'visibility' => "1"
                );

                $data_filter = array(
                    'visibility' => '1'
                );

                // $arr_id = array('133', '134', '135');
                // $arr_id = array('133', '134', '135');

                $this->MTujuan->insert($data_tujuan);
                // $this->MSurat->update($id_surat, $data);
                // $this->MTujuan->updatebulk($data_filter, $arr_id);
                $perihal_surat = $this->MSurat->get_perihal_surat($id_surat);
                // Kirim notifikasi Whatsapp saat membalas surat
                $user_pengirim = $this->ion_auth->user()->row();
                $user_penerima = $this->ion_auth->user($kepada)->row();
                $no_hp = $user_penerima->phone;
                $dari = $user_pengirim->first_name . ' ' . $user_pengirim->last_name;
                $perihal = $perihal_surat->perihal;
                $link = base_url('surat/read/') . $id_surat;

                whatsapp($no_hp, $dari, $perihal, $link);
                redirect(site_url('surat/read/') . $id_surat);
            } else {
                $this->session->set_flashdata('error', 'Disposisi Gagal Terkirim!');
                redirect(site_url('surat/read/') . $id_surat);
            }
        } else {
            // jika gagal masuk ke tabel
            $this->session->set_flashdata('error', 'Disposisi Gagal Terkirim!');
            redirect(site_url('surat/read/') . $id_surat);
        }
    }

    public function create()
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('surat/create_action'),
            'id' => set_value('id'),
            'tanggal' => set_value('tanggal'),
            'nomor_surat' => set_value('nomor_surat'),
            'lampiran' => set_value('lampiran'),
            'perihal' => set_value('perihal'),
            'nomor_agenda' => set_value('nomor_agenda'),
            'tgl_agenda' => set_value('tgl_agenda'),
            'isi_surat' => set_value('isi_surat'),
        );
        $data['title'] = 'Surat';
        $data['subtitle'] = '';
        $data['crumb'] = [
            'Dashboard' => '',
        ];
        $user_groups = $this->ion_auth->get_users_groups($this->session->userdata('user_id'))->result();
        // print_r($user_groups); echo $user_groups[0]->id; exit;
        $data['list_permission'] = $this->Permission_model->get_all_by_id_groups($user_groups[0]->id);
        $data['list_user'] = $this->Users_model->get_all();
        $data['page'] = 'surat/surat_form';
        $this->load->view('template/backend', $data);
    }

    public function create_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $jumlahData = count($_FILES['attachment']['name']);
            // Membuat Variable untuk dimasukkan ke tabel surat

            $jenis_surat = $this->input->post('jenis_surat', TRUE);
            if ($jenis_surat == NULL) {
                $jenis_surat = "internal";
            }
            $data = array(
                'tanggal' => $this->input->post('tanggal', TRUE),
                'nomor_surat' => $this->input->post('nomor_surat', TRUE),
                'lampiran' => $jumlahData,
                'perihal' => $this->input->post('perihal', TRUE),
                'isi_surat' => $this->input->post('isi_surat', TRUE),
                'jenis' => $jenis_surat
            );

            // Insert ke tabel surat 
            $id_surat = $this->MSurat->insert($data);
            //print_r($kepada);

            // Masukan ke tabel tujuan
            if ($id_surat) {
                // cek array tujuan/kepada lebih dari satu? dalam bentuk array
                $kepada = $this->input->post('kepada');
                if ($kepada) {
                    $id_pengirim = $this->session->userdata('user_id');

                    foreach ($kepada as $key => $value) {
                        $id_tujuan = $value;
                        // $id_pengirims['x'] = $this->Users_model->cekusergroups($id_pengirim);
                        // $id_tujuans['y'] = $this->Users_model->cekusergroups($id_tujuan);
                        // $permission = $this->Permission_model->get_permision($id_pengirims, $id_tujuans);

                        $data_tujuan = array(
                            'id_surat' => $id_surat,
                            'dari' => $this->session->userdata('user_id'), // dari user id yang login
                            'kepada' => $value,
                        );

                        $id_tujuan = $this->MTujuan->insert($data_tujuan);


                        // Kirim notifikasi Whatsapp
                        $user_pengirim = $this->ion_auth->user()->row();
                        $user_penerima = $this->ion_auth->user($value)->row();
                        $no_hp = $user_penerima->phone;
                        $dari = $user_pengirim->first_name . ' ' . $user_pengirim->last_name;
                        $perihal = $this->input->post('perihal');
                        $link = base_url('surat/read/') . $id_surat;

                        whatsapp($no_hp, $dari, $perihal, $link);

                        // reset data tujuan
                        reset($data_tujuan);

                        // if (!empty($permission)) {
                        //     $data_tujuan2 = array(
                        //         'id_surat' => $id_surat,
                        //         'dari' => $this->session->userdata('user_id'), // dari user id yang login
                        //         'kepada' => 10,
                        //     );
                        //     $id_tujuan2 = $this->MTujuan->insert($data_tujuan2);
                        // }
                    }
                }


                // cek file apakah upload file atau tidak
                // Hitung Jumlah File/Gambar yang dipilih
                $dataLampiran = NULL;
                if (!empty($_FILES['attachment']['name'])) {
                    for ($i = 0; $i < $jumlahData; $i++) :
                        // Inisi_suratalisasi Nama,Tipe,Dll.
                        $_FILES['file']['name']     = $_FILES['attachment']['name'][$i];
                        $_FILES['file']['type']     = $_FILES['attachment']['type'][$i];
                        $_FILES['file']['tmp_name'] = $_FILES['attachment']['tmp_name'][$i];
                        $_FILES['file']['size']     = $_FILES['attachment']['size'][$i];
                        $config['upload_path']   = './upload/surat-internal/';
                        $config['allowed_types'] = 'jpg|png|doc|docx|xls|xlsx|pdf|zip|rar|ppt|pptx';
                        // Memanggil Library Upload dan Setting Konfigurasi
                        $this->load->library('upload', $config);
                        $this->upload->initialize($config);
                        if ($this->upload->do_upload('file')) { // Jika Berhasil Upload
                            $fileData = $this->upload->data(); // Lakukan Upload Data
                            // Membuat Variable untuk dimasukkan ke Database
                            $dataLampiran[$i]['file_surat'] = $fileData['file_name'];
                            $dataLampiran[$i]['id_surat'] = $id_surat;
                            $dataLampiran[$i]['id_tujuan'] = $id_tujuan;
                        }
                    endfor; // Penutup For               
                    if ($dataLampiran !== null) { // Jika Berhasil Upload

                        // Insert ke Database 
                        $this->MSuratLampiran->upload($dataLampiran);
                    }
                }

                // cek apakah ada tembusan atau tidak
                $tembusan = $this->input->post('tembusan');
                if ($tembusan) {
                    foreach ($tembusan as $key => $value) {
                        $data_tembusan = array(
                            'id_surat' => $id_surat,
                            'kepada' => $value,
                        );
                        $this->MTembusan->insert($data_tembusan);
                        // Kirim notifikasi Whatsapp
                        $user_pengirim = $this->ion_auth->user()->row();
                        $user_penerima = $this->ion_auth->user($value)->row();
                        $no_hp = $user_penerima->phone;
                        $dari = $user_pengirim->first_name . ' ' . $user_pengirim->last_name;
                        $perihal = $this->input->post('perihal');
                        $link = base_url('surat/read/') . $id_surat;

                        whatsapp($no_hp, $dari, $perihal, $link);
                        reset($data_tembusan);
                    }
                }
                $this->session->set_flashdata('success', 'Surat Terkirim');
                redirect(site_url('surat/terkirim'));
            } else {
                // jika gagal masuk ke tabel
                $this->session->set_flashdata('error', 'Surat Gagal Terkirim!');
                redirect(site_url('surat/create'));
            }
        }
    }

    public function update($id)
    {
        $row = $this->MSurat->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('surat/update_action'),
                'id' => set_value('id', $row->id),
                'tanggal' => set_value('tanggal', $row->tanggal),
                'nomor_surat' => set_value('nomor_surat', $row->nomor_surat),
                'lampiran' => set_value('lampiran', $row->lampiran),
                'perihal' => set_value('perihal', $row->perihal),
                'nomor_agenda' => set_value('nomor_agenda', $row->nomor_agenda),
                'tgl_agenda' => set_value('tgl_agenda', $row->tgl_agenda),
                'post_date' => set_value('post_date', $row->post_date),
                'status' => set_value('status', $row->status),
            );
            $data['title'] = 'Surat';
            $data['subtitle'] = '';
            $data['crumb'] = [
                'Dashboard' => '',
            ];

            $data['page'] = 'surat/surat_form';
            $this->load->view('template/backend', $data);
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('surat'));
        }
    }

    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'tanggal' => $this->input->post('tanggal', TRUE),
                'nomor_surat' => $this->input->post('nomor_surat', TRUE),
                'lampiran' => $this->input->post('lampiran', TRUE),
                'perihal' => $this->input->post('perihal', TRUE),
                'nomor_agenda' => $this->input->post('nomor_agenda', TRUE),
                'tgl_agenda' => $this->input->post('tgl_agenda', TRUE),
                'post_date' => $this->input->post('post_date', TRUE),
                'status' => $this->input->post('status', TRUE),
            );

            $this->MSurat->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('success', 'Update Record Success');
            redirect(site_url('surat'));
        }
    }

    public function delete($id)
    {
        $row = $this->MSurat->get_by_id($id);

        if ($row) {
            $this->MSurat->delete($id);
            $this->session->set_flashdata('success', 'Delete Record Success');
            redirect(site_url('surat'));
        } else {
            $this->session->set_flashdata('error', 'Record Not Found');
            redirect(site_url('surat'));
        }
    }

    public function deletebulk()
    {
        $delete = $this->MSurat->deletebulk();
        if ($delete) {
            $this->session->set_flashdata('success', 'Delete Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'Delete Record failed');
        }
        echo $delete;
    }
    public function updatebulk()
    {
        $update = $this->MSurat->updatebulk();
        if ($update) {
            $this->session->set_flashdata('success', 'update Record Success');
        } else {
            $this->session->set_flashdata('message_error', 'update Record failed');
        }
        echo $update;
    }

    public function _rules()
    {
        $this->form_validation->set_rules('tanggal', 'tanggal', 'trim|required');
        $this->form_validation->set_rules('nomor_surat', 'nomor surat', 'trim|required');
        // $this->form_validation->set_rules('lampiran', 'lampiran', 'trim|required');
        $this->form_validation->set_rules('perihal', 'perihal', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
    public function _rules2()
    {
        // $this->form_validation->set_rules('tanggal', 'tanggal', 'trim|required');
        // $this->form_validation->set_rules('nomor_surat', 'nomor surat', 'trim|required');
        $this->form_validation->set_rules('kepada[]', 'Tujuan', 'trim|required');
        $this->form_validation->set_rules('isi_surat', 'Isi', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }
    public function _rules_agenda()
    {
        // $this->form_validation->set_rules('tanggal', 'tanggal', 'trim|required');
        // $this->form_validation->set_rules('nomor_surat', 'nomor surat', 'trim|required');
        $this->form_validation->set_rules('kepada_agenda', 'Tujuan', 'trim|required');
        // $this->form_validation->set_rules('isi_surat', 'Isi', 'trim|required');

        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }


    public function print_surat($id)
    {

        $row = $this->MSurat->get_by_id($id);

        if ($row) {
            $DataKepada = $this->MTujuan->kepada_suratCOBA($id);
            // foreach ($DataKepada as $dk) :
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
                'post_waktu' => substr($row->post_date, 10),
                // 'KFirstName' => $dk['first_name'],
                // 'KLastName' => $dk['last_name'],
                // 'KJabatan' => $dk['jabatan']

            );
            $data['datakepada'] = $this->MTujuan->kepada_suratCOBA($id);
            $data['timeline'] = $this->MSurat->get_timeline_print($id);
            $data['kepada_tembusan'] = $this->MTembusan->kepada_tembusan($id);
            $data['print_button'] = 1;

            require_once __DIR__ . '/../../vendor/autoload.php';
            $mpdf = new \Mpdf\Mpdf([
                'default_font_size' => 10,
                'margin_top' => 35,
                'margin_left' => 20,
                'margin_right' => 20,
                'mirrorMargins' => true
            ]);
            $html = $this->load->view('surat/print', $data, true);
            $header = $this->load->view('surat/print_header', '', true);
            $footer = $this->load->view('surat/print_footer', '', true);
            $mpdf->defaultheaderline = 0;
            $mpdf->defaultfooterline = 0;
            $mpdf->SetHeader($header);
            $mpdf->SetFooter($footer);
            $mpdf->WriteHTML($html);
            $nama_file = $row->perihal . '_' . $row->nomor_surat . '_' . $row->tanggal . '.pdf';
            $mpdf->Output($nama_file, 'I');
            // endforeach;
        } else {
            $this->session->set_flashdata('error', 'Surat tidak ditemukan!');
            redirect(site_url('surat'));
        }
    }

    public function print_surat_2($id)
    {

        $row = $this->MSurat->get_by_id($id);

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
            $data['id_tujuan'] = $this->uri->segment(4);
            $data['timeline'] = $this->MSurat->get_timeline_print2($id, $data['id_tujuan']);
            $data['kepada'] = $this->MTujuan->kepada_surat_print2($id);
            $data['kepada_tembusan'] = $this->MTembusan->kepada_tembusan($id);
            $data['print_button'] = 2;
            require_once __DIR__ . '/../../vendor/autoload.php';
            $mpdf = new \Mpdf\Mpdf([
                'default_font_size' => 10,
                'margin_top' => 35,
                'margin_left' => 20,
                'margin_right' => 20,
                'mirrorMargins' => true
            ]);
            // $this->load->view('surat/print', $data);
            $html = $this->load->view('surat/print', $data, true);
            $header = $this->load->view('surat/print_header', '', true);
            $footer = $this->load->view('surat/print_footer', '', true);
            $mpdf->defaultheaderline = 0;
            $mpdf->defaultfooterline = 0;
            $mpdf->SetHeader($header);
            $mpdf->SetFooter($footer);
            $mpdf->WriteHTML($html);
            $nama_file = $row->perihal . '_' . $row->nomor_surat . '_' . $row->tanggal . '.pdf';
            $mpdf->Output($nama_file, 'I');
        } else {
            $this->session->set_flashdata('error', 'Surat tidak ditemukan!');
            redirect(site_url('surat'));
        }
    }

    // tombol selesai staff
    public function btn_selesai_all($id_surat)
    {
        // cek semua status tujuan (status progress) sudah 1


        // $id_surat = $this->input->post('id', TRUE);
        $data['status'] = "1";
        $data_tujuan['status_progress'] = "1";

        $this->MSurat->update($id_surat, $data);
        $this->MTujuan->update_tujuan($id_surat, $data_tujuan);
        redirect(site_url('surat/read/') . $id_surat);
    }

    // tombol selesai umum
    public function btn_selesai($id_surat, $id_user)
    {
        // $id_surat = $this->input->post('id', TRUE);
        $data['status_progress'] = "1";
        $this->MTujuan->update_status_progress($id_surat, $id_user, $data);
        $this->MTujuan->selesai_surat($id_surat);
        redirect(site_url('surat/read/') . $id_surat);
    }
    public function view_pdf($file)
    {
        $data['nama_file'] = $file;
        $this->load->view('surat/view_pdf', $data);
    }

    public function laporan_surat()
    {

        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/laporan_surat?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/laporan_surat?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/laporan_surat';
            $config['first_url'] = base_url() . 'surat/laporan_surat';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;

        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');

        if ($dari) {
            $config['total_rows'] = $this->MSurat->laporan_surat_total($q, $dari, $sampai);
            $surat = $this->MSurat->laporan_surat($config['per_page'], $start, $q, $dari, $sampai);
        } else {
            $config['total_rows'] = $this->MSurat->total_rows($q);
            $surat = $this->MSurat->get_limit_data($config['per_page'], $start, $q);
        }

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Laporan';
        $data['subtitle'] = 'Laporan Surat';

        $data['search_page'] = 'surat/laporan_surat';
        $data['crumb'] = [
            'Surat' => '',
        ];

        $data['page'] = 'surat/laporan_surat';
        $this->load->view('template/backend', $data);
    }

    public function laporan_surat_harian()
    {

        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/laporan_surat_harian?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/laporan_surat_harian?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/laporan_surat_harian';
            $config['first_url'] = base_url() . 'surat/laporan_surat_harian';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;

        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');

        if ($dari) {
            $config['total_rows'] = $this->MSurat->laporan_surat_harian_total($q, $dari, $sampai);
            $surat = $this->MSurat->laporan_surat_harian($config['per_page'], $start, $q, $dari, $sampai);
        } else {
            $config['total_rows'] = $this->MSurat->laporan_surat_harian_row($q);
            $surat = $this->MSurat->get_laporan_surat_harian($config['per_page'], $start, $q);
        }

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Laporan';
        $data['subtitle'] = 'Jumlah Surat Harian';

        $data['search_page'] = 'surat/laporan_surat_harian';
        $data['crumb'] = [
            'Surat' => '',
        ];

        $data['page'] = 'surat/laporan_surat_harian';
        $this->load->view('template/backend', $data);
    }

    public function laporan_surat_bulanan()
    {

        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));

        if ($q <> '') {
            $config['base_url'] = base_url() . 'surat/laporan_surat_bulanan?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'surat/laporan_surat_bulanan?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'surat/laporan_surat_bulanan';
            $config['first_url'] = base_url() . 'surat/laporan_surat_bulanan';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;

        $dari =  substr($this->input->post('dari'), 0, 7);
        $sampai = substr($this->input->post('sampai'), 0, 7);
        if ($dari) {
            $config['total_rows'] = $this->MSurat->laporan_surat_bulanan_total($q, $dari, $sampai);
            $surat = $this->MSurat->laporan_surat_bulanan($config['per_page'], $start, $q, $dari, $sampai);
        } else {
            $config['total_rows'] = $this->MSurat->laporan_surat_bulanan_row($q);
            $surat = $this->MSurat->get_laporan_surat_bulanan($config['per_page'], $start, $q);
        }

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'surat_data' => $surat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $data['title'] = 'Laporan';
        $data['subtitle'] = 'Jumlah Surat Bulanan';

        $data['search_page'] = 'surat/laporan_surat_bulanan';
        $data['crumb'] = [
            'Surat' => '',
        ];

        $data['page'] = 'surat/laporan_surat_bulanan';
        $this->load->view('template/backend', $data);
    }
}


/* End of file Surat.php */
/* Location: ./application/controllers/Surat.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:05 */
/* http://harviacode.com */
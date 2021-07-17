<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MSurat extends CI_Model
{

    public $table = 'surat';
    public $id = 'id';
    public $order = 'DESC';

    function __construct()
    {
        parent::__construct();
    }

    // get all
    function get_all()
    {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table)->result();
    }


    // get data by id
    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }
    function get_no_agenda($id)
    {
        $this->db->where('id', $id);
        $this->db->where('nomor_agenda', NULL);
        return $this->db->get('surat')->result_array();
    }

    function cek_penerima_surat($id, $kepada)
    {
        $this->db->select('s.id, t.kepada,t.dari');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id', 'left');
        $this->db->where('s.id', $id);
        $this->db->where('t.kepada', $kepada);
        $this->db->or_where('t.dari', $kepada);
        if ($this->db->get($this->table)->result()) {
            return true;
        } else {
            return false;
        }
    }

    function cek_penerima_tembusan($id, $kepada)
    {
        $this->db->select('s.id, t.kepada');
        $this->db->from('surat s');
        $this->db->join('tembusan t', 't.id_surat = s.id', 'left');
        $this->db->where('s.id', $id);
        $this->db->where('t.kepada', $kepada);
        if ($this->db->get($this->table)->result()) {
            return true;
        } else {
            return false;
        }
    }

    function get_timeline($id)
    {
        $this->db->select('s.*, t.kepada,t.status_progress,t.note, t.isi, t.id as id_tujuan, t.status as status_tujuan,t.dari,t.post_date,(SELECT first_name from users where id = t.dari) nama_depan, (SELECT jabatan from users where id = t.dari) jabatan,(SELECT id from users where id = t.dari) id_pengirim,(SELECT last_name from users where id = t.dari) nama_belakang,t.visibility');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id', 'right');
        $this->db->join('users u', 'u.id = t.kepada');
        // $this->db->join('surat_lampiran sl', 'sl.id_tujuan = t.id');
        $this->db->where('s.id', $id);
        $this->db->group_by('t.isi');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result_array();

        // return $this->db->query("SELECT * from surat right join tujuan on surat.id = tujuan.id_surat WHERE surat.id=$id group by tujuan.isi")->result_array();
    }

    function get_timeline_print($id)
    {
        $this->db->select('s.*, t.kepada,t.note, t.isi, t.id as id_tujuan, t.status as status_tujuan,t.dari,t.post_date,(SELECT first_name from users where id = t.dari) nama_depan, (SELECT jabatan from users where id = t.dari) jabatan,(SELECT id from users where id = t.dari) id_pengirim,(SELECT nik from users where id = t.dari) nik,(SELECT last_name from users where id = t.dari) nama_belakang,t.visibility');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id', 'right');
        $this->db->join('users u', 'u.id = t.kepada');
        // $this->db->join('surat_lampiran sl', 'sl.id_tujuan = t.id');
        $this->db->where('s.id', $id);
        $this->db->group_by('t.isi');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->row();
    }

    function get_timeline_print2($id, $id_tujuan)
    {
        $this->db->select('s.*, t.kepada,t.note, t.isi, t.id as id_tujuan, t.status as status_tujuan,t.dari,t.post_date,(SELECT first_name from users where id = t.dari) nama_depan, (SELECT jabatan from users where id = t.dari) jabatan,(SELECT id from users where id = t.dari) id_pengirim,(SELECT nik from users where id = t.dari) nik,(SELECT last_name from users where id = t.dari) nama_belakang,t.visibility');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id', 'right');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->where('s.id', $id);
        $this->db->where('t.id', $id_tujuan);
        $this->db->group_by('t.note');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->row();
    }
    // function get_visibility($id)
    // {
    //     $this->db->select('tujuan.visibility,surat.id');
    //     $this->db->from('tujuan');
    //     $this->db->join('surat', 'tujuan.id_surat = surat.id');
    //     $this->db->where('surat.id', $id);
    //     return $this->db->get()->resulit();
    // }


    function get_timeline_user2()
    {
        $this->db->select('*');
        $this->db->from('users');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result_array();

        // return $this->db->query("SELECT * from surat right join tujuan on surat.id = tujuan.id_surat WHERE surat.id=$id group by tujuan.isi")->result_array();
    }
    function get_timeline_user($id)
    {
        $this->db->select('s.id, t.kepada, t.dari,(SELECT first_name from users where id = t.dari) nd,(SELECT last_name from users where id = t.dari) nb,(SELECT jabatan from users where id = t.dari) jbtn,(SELECT id from users where id = t.dari) id_pengirim,(SELECT first_name from users where id = t.kepada) nama_depan, (SELECT jabatan from users where id = t.kepada) jabatan,(SELECT id from users where id = t.kepada) id_penerima,(SELECT last_name from users where id = t.kepada) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id', 'right');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->where('s.id', $id);
        $this->db->group_by('t.kepada');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result_array();

        // return $this->db->query("SELECT * from surat right join tujuan on surat.id = tujuan.id_surat WHERE surat.id=$id group by tujuan.isi")->result_array();
    }



    // get total rows
    function total_rows($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->group_by('s.id');
        return $this->db->get()->num_rows();
    }
    function total_rows_eksternal($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->group_by('s.id');
        $this->db->where('t.kepada', $this->session->userdata('user_id'));
        $this->db->where('s.jenis', 'eksternal');
        $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' )");
        return $this->db->get()->num_rows();
    }
    function total_terkirim($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.dari', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.dari', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' )");
        }
        $this->db->group_by('s.id');
        return $this->db->get()->num_rows();
    }
    function total_selesai($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('s.status', '1');
        $this->db->group_by('s.id');
        return $this->db->count_all_results();
    }


    function total_diproses($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('s.status', '0');
        $this->db->group_by('s.id');
        return $this->db->count_all_results();
    }
    function total_unread($q = NULL)
    {
        $this->db->select('s.id');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('t.status', '0');
        $this->db->group_by('s.id');
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 's.id=t.id_surat');

        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function get_limit_data_eksternal($limit, $start, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->where('t.dari', $this->session->userdata('user_id'));
        // $this->db->or_where('t.kepada', $this->session->userdata('user_id'));
        $this->db->where('s.jenis', 'eksternal');
        $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function list_selesai($limit, $start = 0, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('s.status', '1');
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result();
    }
    function list_diproses($limit, $start = 0, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('s.status', '0');
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result();
    }
    function list_unread($limit, $start = 0, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        if ($q) {
            $this->db->join('users u', 't.dari=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.kepada', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        }
        $this->db->where('t.status', '0');
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result();
    }

    // get data with limit and search
    function get_surat_terkirim($limit, $start = 0, $q = NULL)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.kepada) nama_depan, (SELECT last_name from users where id = t.kepada) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 's.id=t.id_surat');
        // $this->db->join('users u', 't.kepada=u.id');
        // $this->db->where('t.dari', $this->session->userdata('user_id'));
        // $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' )");

        if ($q) {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.dari', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' OR u.first_name LIKE '%" . $q . "%')");
        } else {
            $this->db->join('users u', 't.kepada=u.id');
            $this->db->where('t.dari', $this->session->userdata('user_id'));
            $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%' )");
        }

        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }



    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id(); // mengembalikan ID terakhir
    }


    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    function get_perihal_surat($id)
    {
        $this->db->select('perihal');
        $this->db->where('id', $id);
        return $this->db->get($this->table)->row();
    }

    public function whatsapp_notif_template_first()
    {
        $this->db->select('say_first');
        $this->db->order_by('rand()');
        $this->db->limit(1);
        $query = $this->db->get('template_notif');
        return $query->row_array();
    }
    public function whatsapp_notif_template_end()
    {
        $this->db->select('say_end');
        $this->db->order_by('id', 'RANDOM');
        $this->db->limit(1);
        $query = $this->db->get('template_notif');
        return $query->row_array();
    }


    function laporan_surat($limit, $start, $q = NULL, $dari, $sampai)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->where('t.kepada', $this->session->userdata('user_id'));
        $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        $this->db->where('s.tanggal >=', $dari);
        $this->db->where('s.tanggal <=', $sampai);
        // $this->db->where("(s.tanggal between " . $dari . " AND " . $sampai . ")");
        $this->db->group_by('s.id');
        $this->db->order_by($this->id, $this->order);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function laporan_surat_total($q = NULL, $dari, $sampai)
    {
        $this->db->select('s.*, t.kepada, t.dari,t.status as status_tujuan, (SELECT first_name from users where id = t.dari) nama_depan, (SELECT last_name from users where id = t.dari) nama_belakang');
        $this->db->from('surat s');
        $this->db->join('tujuan t', 't.id_surat = s.id');
        $this->db->join('users u', 'u.id = t.kepada');
        $this->db->where('t.kepada', $this->session->userdata('user_id'));
        $this->db->where("(s.perihal LIKE '%" . $q . "%' OR nomor_surat LIKE '%" . $q . "%')");
        $this->db->where('s.tanggal >=', $dari);
        $this->db->where('s.tanggal <=', $sampai);
        $this->db->group_by('s.id');
        return $this->db->get()->num_rows();
    }

    // laporan harian
    function get_laporan_surat_harian($limit, $start, $q = NULL)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_harian');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function laporan_surat_harian($limit, $start, $q = NULL, $dari, $sampai)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_harian');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->where('tanggal >=', $dari);
        $this->db->where('tanggal <=', $sampai);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function laporan_surat_harian_total($q = NULL, $dari, $sampai)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_harian');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->where('tanggal >=', $dari);
        $this->db->where('tanggal <=', $sampai);
        return $this->db->get()->num_rows();
    }
    function laporan_surat_harian_row($q = NULL)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_harian');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        return $this->db->get()->num_rows();
    }

    // laporan bulanan
    function get_laporan_surat_bulanan($limit, $start, $q = NULL)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_bulanan');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function laporan_surat_bulanan($limit, $start, $q = NULL, $dari, $sampai)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_bulanan');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->where('tanggal >=', $dari);
        $this->db->where('tanggal <=', $sampai);
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function laporan_surat_bulanan_total($q = NULL, $dari, $sampai)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_bulanan');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        $this->db->where('tanggal >=', $dari);
        $this->db->where('tanggal <=', $sampai);
        return $this->db->get()->num_rows();
    }
    function laporan_surat_bulanan_row($q = NULL)
    {
        $this->db->select("*");
        $this->db->from('view_jumlah_surat_bulanan');
        $this->db->where('kepada', $this->session->userdata('user_id'));
        return $this->db->get()->num_rows();
    }
}

/* End of file MSurat.php */
/* Location: ./application/models/MSurat.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:05 */
/* http://harviacode.com */
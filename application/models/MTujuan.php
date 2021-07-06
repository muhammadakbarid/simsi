<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MTujuan extends CI_Model
{

    public $table = 'tujuan';
    public $id = 'id';
    public $order = 'DESC';

    function __construct()
    {
        parent::__construct();
    }
    function get_status_tujuan($id_surat, $id_user)
    {
        $this->db->select('status');
        $this->db->from('tujuan');
        $this->db->where('id_surat', $id_surat);
        $this->db->where('kepada', $id_user);
        return $this->db->get()->row();
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

    // get total rows
    function total_rows($q = NULL)
    {
        $this->db->like('id', $q);
        $this->db->or_like('id_surat', $q);
        $this->db->or_like('dari', $q);
        $this->db->or_like('kepada', $q);
        $this->db->or_like('post_date', $q);
        $this->db->or_like('status', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL)
    {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id', $q);
        $this->db->or_like('id_surat', $q);
        $this->db->or_like('dari', $q);
        $this->db->or_like('kepada', $q);
        $this->db->or_like('post_date', $q);
        $this->db->or_like('status', $q);
        $this->db->limit($limit, $start);
        return $this->db->get($this->table)->result();
    }

    function kepada_surat($id_surat)
    {
        $this->db->select('t.*, u.first_name, u.last_name, u.jabatan');
        $this->db->from('tujuan t');
        $this->db->join('users u', 'u.id = t.kepada', 'left');
        // $this->db->join('surat_lampiran sl', 'sl.id_tujuan = t.id');
        $this->db->where('t.id_surat', $id_surat);
        $this->db->where('t.isi', NULL);
        return $this->db->get()->result();
        //$this->db->get()->result(); echo $this->db->last_query(); exit;
    }
    // 
    function kepada_suratCOBA($id_surat)
    {
        $this->db->select('t.*, u.first_name, u.last_name, u.jabatan');
        $this->db->from('tujuan t');
        $this->db->join('users u', 'u.id = t.kepada', 'left');
        // $this->db->join('surat_lampiran sl', 'sl.id_tujuan = t.id');
        $this->db->where('t.id_surat', $id_surat);
        $this->db->where('t.isi', NULL);
        return $this->db->get()->result_array();
        //$this->db->get()->result(); echo $this->db->last_query(); exit;
    }
    function kepada_surat_print2($id_surat)
    {
        $this->db->select('t.*, u.first_name, u.last_name, u.jabatan');
        $this->db->from('tujuan t');
        $this->db->join('users u', 'u.id = t.dari', 'left');
        // $this->db->join('surat_lampiran sl', 'sl.id_tujuan = t.id');
        $this->db->where('t.id_surat', $id_surat);
        $this->db->where('t.isi', NULL);
        return $this->db->get()->row_object();
        //$this->db->get()->result(); echo $this->db->last_query(); exit;
    }

    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id(); // mengembalikan ID terakhir
    }
    function get_timeline_l($id)
    {
        $this->db->select('l.file_surat,t.id');
        $this->db->from('surat_lampiran l');
        $this->db->join('tujuan t', 't.id = l.id_tujuan', 'right');
        $this->db->where('l.id_surat', $id);
        // $this->db->group_by('t.');
        $this->db->order_by($this->id, $this->order);
        return $this->db->get()->result(); // return $this->db->query("SELECT * from surat right join tujuan on surat.id = tujuan.id_surat WHERE surat.id=$id group by tujuan.isi")->result_array();
    }
    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }
    function update_tujuan($id, $data)
    {
        $this->db->where('id_surat', $id);
        $this->db->where('dari', $this->session->userdata('user_id'));
        $this->db->update($this->table, $data);
    }
    function update_status2($id, $data)
    {
        $this->db->where('id_surat', $id);
        $this->db->update($this->table, $data);
    }

    function update_status($ids, $data, $x)
    {
        $this->db->where('id_surat', $ids);
        $this->db->where('kepada', $x);
        $this->db->update($this->table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

    // delete bulkdata
    function deletebulk()
    {
        $data = $this->input->post('msg_', TRUE);
        $arr_id = explode(",", $data);
        $this->db->where_in($this->id, $arr_id);
        return $this->db->delete($this->table);
    }
    function updatebulk($data2, $data)
    {
        $this->db->where_in('id', $data);
        $this->db->update($this->table, $data2);
    }
    public function upload($data = array())
    {
        // Insert Ke Database dengan Banyak Data Sekaligus
        return $this->db->insert_batch($this->table, $data);
    }

    public function update_status_progress($id_surat, $id_user, $data)
    {
        $this->db->where('id_surat', $id_surat);
        $this->db->where('dari', $id_user);
        $this->db->update($this->table, $data);
    }

    public function get_status_progress($id)
    {
        $this->db->select('status_progress');
        $this->db->where('id_surat', $id);
        $this->db->where('dari', $this->session->userdata('user_id'));
        $status = $this->db->get($this->table)->row();
        if ($status == NULL) {
            return "0";
        } else {
            return $status;
        }
    }

    public function cekstatusproggressall($id)
    {

        if ($this->ion_auth->in_group(29)) {
            $staff = TRUE;
        } else {
            $staff = FALSE;
        }

        $this->db->where('status_progress', '0');
        $this->db->where('id_surat', $id);

        if ($staff) {
            $this->db->where('dari !=', $this->session->userdata('user_id'));
        }
        $status = $this->db->get($this->table)->row();
        // $this->db->get($this->table)->row();
        // echo $this->db->last_query();
        // exit;


        if ($status) {
            // jika masih ada 0 maka tombol disable
            return TRUE;
        } else {
            return FALSE;
        }
    }

    // surat selesai jika semua sudah klik tombol selesai
    public function selesai_surat($id)
    {
        $this->db->where('status_progress', '0');
        $this->db->where('id_surat', $id);
        $status = $this->db->get($this->table)->row();

        if ($status == NULL) {
            // jika status progress = 1 maka status surat selesai
            $data['status'] = '1';
            $this->db->where('id', $id);
            $this->db->update('surat', $data);
        }
    }
}

/* End of file MTujuan.php */
/* Location: ./application/models/MTujuan.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-09-02 08:33:49 */
/* http://harviacode.com */
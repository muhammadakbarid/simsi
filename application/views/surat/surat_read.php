<style>
    .select2 {
        width: 100% !important;
        /* overrides computed width, 100px in your demo */
    }
</style>
<!-- <script src="<?= base_url('assets/js/tinymce.min.js'); ?>" referrerpolicy="origin"></script> -->


<div class="row">
    <div class="col-xs-12 col-md-12">
        <?php if ($this->ion_auth->in_group(29) and (empty($nomor_agenda))) : ?>
            <form action="<?php echo site_url('surat/agenda_action'); ?>" method="post" id="formbulk">
            <?php endif ?>

            <ul class="timeline">
                <li>
                    <?php if ($status == 1) : ?>
                        <div class="alert alert-success "><i class="fa fa-check"></i> Status surat telah selesai.</div>
                    <?php else : ?>
                        <div class="alert alert-warning "><i class="fa fa-refresh"></i> Status surat sedang diproses.</div>
                    <?php endif ?>

                </li>

                <?php $i = 1; ?>
                <?php foreach ($timeline as $t) : ?>
                    <?php $post_tanggal = substr($t['post_date'], 0, 10);
                    $post_waktu = substr($t['post_date'], 10); ?>
                    <!-- timeline time label -->
                    <?php if (!empty($nomor_agenda)) : ?>
                        <?php if ($t['visibility'] == '0' and !$this->ion_auth->in_group(29)) : ?>
                            <li class="time-label" hidden>
                            <?php else : ?>
                            <li class="time-label">
                            <?php endif ?>
                        <?php else : ?>
                            <li class="time-label">
                            <?php endif ?>

                            <?php if ($t['status_progress'] == 1) : ?>
                                <span class="bg-green">
                                <?php else : ?>
                                    <span class="bg-red">
                                    <?php endif ?>

                                    <?= dateIna($post_date); ?>
                                    </span>
                            </li>
                            <!-- /.timeline-label -->

                            <!-- timeline item -->
                            <?php if (!empty($nomor_agenda)) : ?>
                                <?php if ($t['visibility'] == '0' and !$this->ion_auth->in_group(29)) : ?>
                                    <li hidden>
                                    <?php else : ?>
                                    <li>
                                    <?php endif ?>
                                <?php else : ?>
                                    <li>
                                    <?php endif ?>
                                    <!-- timeline icon -->
                                    <!-- ceklis agenda -->
                                    <?php if ($this->ion_auth->in_group(array(29, 28)) and (empty($nomor_agenda))) : ?>
                                        <input type="checkbox" class="fa bg-blue" name="filter_surat[]" value="<?= $t['id_tujuan']; ?>">
                                    <?php else : ?>
                                        <i class="fa fa-<?php echo ($i == 1 ? "envelope" : "reply") ?> bg-blue"></i>
                                    <?php endif ?>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i> <?= timeAgo($post_date); ?></span>
                                        <small class="time">
                                            <?php if (empty($t['isi'])) : ?>
                                                <a href="<?= base_url('surat/print_surat/') . $id; ?>" target="_blank" type="button" id="print_button" class="btn btn-default btn-xs"><i class="fa fa-print"></i> Print Surat</a>
                                            <?php endif ?>
                                            <?php if (!empty($t['note'])) : ?>
                                                <a href="<?= base_url('surat/print_surat_2/') . $id . '/' . $t['id_tujuan']; ?>" target="_blank" type="button" id="print_button" class="btn btn-default btn-xs"><i class="fa fa-print"></i> Print Surat</a>
                                            <?php endif ?>
                                        </small>
                                        <h3 class="timeline-header"><a><?php echo ($i == 1 ? "Dari" : "Dibalas Oleh") ?>: <?= $t['nama_depan'] . " " . $t['nama_belakang'] . " (" . $t['jabatan'] ?>)</a></h3>

                                        <div class="timeline-body">
                                            <!-- cek jika, urutan pertama di timeline, ambil data dari tabel surat -->
                                            <?php if ($i == 1) : ?>
                                                <table class="table table-nonfluid">
                                                    <tr>
                                                        <td>No. Surat</td>
                                                        <td>:</td>
                                                        <td><?php echo $t['nomor_surat'] ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Perihal</td>
                                                        <td>:</td>
                                                        <td><?php echo $t['perihal'] ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Lampiran</td>
                                                        <td>:</td>
                                                        <td><?php echo $t['lampiran'] ?></td>
                                                    </tr>
                                                    <?php if ($nomor_agenda) : ?>
                                                        <tr>
                                                            <td>Nomor Agenda</td>
                                                            <td>:</td>
                                                            <td><?php echo $t['nomor_agenda'] ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Tanggal Agenda</td>
                                                            <td>:</td>
                                                            <td><?php echo $t['tgl_agenda'] ?></td>
                                                        </tr>
                                                    <?php endif ?>
                                                    <tr>
                                                        <td>Ditujukan Kepada</td>
                                                        <td>:</td>
                                                        <td>
                                                            <?php if ($kepada) :
                                                                $jumlah = count($kepada);
                                                                $x = 1;
                                                                foreach ($kepada as $k) :
                                                                    echo $k->first_name;
                                                                    echo " " . $k->last_name;
                                                                    echo " (" . $k->jabatan . ")";
                                                                    if ($jumlah > $x) :
                                                                        echo ", ";
                                                                    endif;
                                                                    $x++;
                                                                endforeach;
                                                            endif ?>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <hr>
                                            <?php endif ?>
                                            <?php if ($t['isi']) : ?>
                                                <?= $t['isi']; ?>
                                            <?php else : ?>
                                                <?= $t['isi_surat']; ?>
                                            <?php endif ?>
                                        </div>
                                        <div class="timeline-footer">
                                            <?php if ($timeline_l) : ?>
                                                <?php if ($i == 1) : ?>
                                                    <hr>
                                                    <strong>File Attachment:</strong><br>
                                                    <?php $j = 1; ?>
                                                    <?php foreach ($timeline_l as $l) : ?>
                                                        <?php echo $j ?>. <a href="<?= base_url('upload/surat-internal/') . $l->file_surat; ?>" target="_blank"><button type="button" class="btn btn-xs btn-default"><i class="fa fa-paperclip" aria-hidden="true"></i> <b><?= $l->file_surat; ?></b></button></a>
                                                        <a href="<?= base_url('surat/view_pdf/') . $l->file_surat; ?>" target="_blank"><button type="button" class="btn btn-xs btn-default"> <b>view</b></button></a><br>

                                                        <?php $j++; ?>
                                                    <?php endforeach ?>
                                                <?php else : ?>
                                                    <?php $lampiran_tujuan = $this->MSuratLampiran->get_by_id_tujuan($t['id_tujuan']); ?>
                                                    <?php if ($lampiran_tujuan) : ?>
                                                        <hr>
                                                        <strong>File Attachment:</strong><br>
                                                        <?php $m = 1; ?>
                                                        <?php foreach ($lampiran_tujuan as $lt) : ?>
                                                            <?php echo $m ?>. <a href="<?= base_url('upload/surat-internal/') . $lt->file_surat; ?>" target="_blank"><button type="button" class="btn btn-xs btn-default"><i class="fa fa-paperclip" aria-hidden="true"></i> <b><?= $lt->file_surat; ?></b></button></a>
                                                            <a href="<?= base_url('surat/view_pdf/') . $lt->file_surat; ?>" target="_blank"><button type="button" class="btn btn-xs btn-default"> <b>view</b></button></a><br>

                                                            <?php $m++; ?>
                                                        <?php endforeach ?>
                                                    <?php endif ?>
                                                <?php endif ?>
                                            <?php endif ?>

                                            <?php if ($kepada_tembusan) : ?>
                                                <div class="col">
                                                    <td>Tembusan</td>
                                                    <td>:</td>
                                                    <td><?php
                                                        $jumlah = count($kepada_tembusan);
                                                        $x = 1;
                                                        foreach ($kepada_tembusan as $k) :
                                                            echo $k->first_name;
                                                            echo " " . $k->last_name;
                                                            echo " (" . $k->jabatan . ")";
                                                            if ($jumlah > $x) :
                                                                echo ", ";
                                                            endif;
                                                            $x++;
                                                        endforeach; ?>
                                                    </td>
                                                </div>
                                            <?php endif ?>
                                        </div>
                                    </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <?php $i++ ?>
                                <?php endforeach ?>
                                <li>
                                    <i class="fa fa-sign-in-alt bg-aqua"></i>

                                    <div class="timeline-item">
                                        <div class="box-footer">
                                            <!-- tombol tombol -->
                                            <div>
                                                <?php if ($status == 1 or $status_progress) : ?>
                                                    <button type="button" id="balas_button" class="btn btn-default" disabled><i class="fa fa-reply"></i> Balas Surat</button>
                                                <?php else : ?>
                                                    <button type="button" id="balas_button" class="btn btn-primary" data-toggle="collapse" data-target="#balas_form"><i class="fa fa-reply"></i> Balas Surat</button>
                                                <?php endif ?>
                                                <?php if ($this->ion_auth->in_group(array(7, 17, 18, 24, 26, 28, 29, 30)) and (empty($nomor_agenda))) : ?>
                                                    <button type="button" id="agenda_button" class="btn btn-default" data-toggle="collapse" data-target="#agenda_form"><i class="fa fa-calendar"></i> Agendakan Surat</button>
                                                    <!-- tombol selesai khusus staff -->
                                                    <?php if ($status == 1 or $status_tombol == TRUE) : ?>
                                                        <a type="button" id="balas_button" class="btn btn-default" disabled><i class="fa fa-save"></i> Selesai</a>
                                                    <?php else : ?>
                                                        <a type="button" id="balas_button" class="btn btn-success" href="<?= base_url('surat/btn_selesai_all/') . $id; ?>"><i class="fa fa-save"></i> Selesai</a>
                                                    <?php endif ?>

                                                <?php else : ?>
                                                    <?php if ($this->ion_auth->in_group(array(8)) and (!empty($nomor_agenda))) : ?>
                                                        <button type="button" id="disposisi" class="btn btn-default" data-toggle="collapse" data-target="#disposisi_form"><i class="fa fa-calendar"></i> Disposisi Surat</button>
                                                    <?php endif; ?>
                                                    <!-- tombol selesai umum -->
                                                    <?php if ($status == 1) : ?>
                                                        <a type="button" id="balas_button" class="btn btn-default" disabled><i class="fa fa-save"></i> Selesai</a>
                                                    <?php else : ?>
                                                        <a type="button" id="balas_button" class="btn btn-success" href="<?= base_url('surat/btn_selesai/') . $id . '/' . $_SESSION['user_id']; ?>"><i class="fa fa-save"></i> Selesai</a>
                                                    <?php endif ?>
                                                <?php endif ?>


                                            </div>

                                            <?php if ($this->ion_auth->in_group(array(7, 17, 18, 24, 26, 28, 29, 30)) and (empty($nomor_agenda))) : ?>
                                                <div id="agenda_form" class="collapse">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Agenda Surat</h3>
                                                        <div class="box-tools pull-right">
                                                            *Mengagendakan surat
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <div class="col-lg-8">
                                                            <div class="form-group">
                                                                <label for="date">Kepada<sup>*</sup> <?php echo form_error('tanggal') ?></label>
                                                                <select class="form-control select2" required="true" name="kepada_agenda" multiple>
                                                                    <?php foreach ($timeline_get_kepada as $lk) : ?>
                                                                        <option value="<?php echo $lk['id'] ?>"><?php echo $lk['first_name'] ?> <?php echo $lk['last_name'] ?> (<?php echo $lk['jabatan'] ?>)</option>

                                                                    <?php endforeach ?>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="varchar">No. Agenda<sup>*</sup></label>
                                                                <input name="no_agenda" required="true" class="form-control"></input>
                                                                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                                                            </div>

                                                            <div class="form-group">
                                                                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                                                                <?php if ($status == 1) : ?>
                                                                    <button type="submit" class="btn btn-primary" hidden>Simpan</button>
                                                                <?php else : ?>
                                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                                <?php endif ?>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4">
                                                        </div>

                                                    </div>
                                                </div>
                                            <?php endif ?>
                                            <?php if ($this->ion_auth->in_group(array(8)) and (!empty($nomor_agenda))) : ?>
                                                <div id="disposisi_form" class="collapse">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Disposisi Surat</h3>
                                                        <div class="box-tools pull-right">
                                                            *Disposisi surat
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <div class="col-lg-8">
                                                            <div class="form-group">
                                                                <label for="date">Kepada<sup>*</sup> <?php echo form_error('tanggal') ?></label>
                                                                <select class="form-control select2" required="true" name="kepada_agenda" multiple>
                                                                    <?php foreach ($timeline_get_kepada as $lk) : ?>
                                                                        <option value="<?php echo $lk['id'] ?>"><?php echo $lk['first_name'] ?> <?php echo $lk['last_name'] ?> (<?php echo $lk['jabatan'] ?>)</option>

                                                                    <?php endforeach ?>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="varchar">Catatan<sup>*</sup></label>
                                                                <input name="no_agenda" required="true" class="form-control"></input>
                                                                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                                                            </div>

                                                            <div class="form-group">
                                                                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                                                                <?php if ($status == 1) : ?>
                                                                    <button type="submit" class="btn btn-primary" hidden>Simpan</button>
                                                                <?php else : ?>
                                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                                <?php endif ?>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4">
                                                        </div>

                                                    </div>
                                                </div>
                                            <?php endif ?>
                                            <?php if ($this->ion_auth->in_group(array(7, 17, 18, 24, 26, 28, 29, 30)) and (empty($nomor_agenda))) : ?>
            </form>
        <?php endif ?>


        <?php if ($status == 1) : ?>
            <div hidden>
            <?php else : ?>
                <div id="balas_form" class="collapse">
                <?php endif ?>

                <div class=" box-header">
                    <div class="box-tools pull-right">
                        *Balas Surat
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <?= form_open_multipart('surat/read_action'); ?>
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="form_group" style="margin-bottom: 5px;">
                                <button type="button" id="tambah_penerima_button" class="btn btn-xs btn-default" data-toggle="collapse" data-target="#tambah_penerima_id"><i class="fa fa-plus"></i> Tambah Penerima Baru</button>
                                <button type="button" id="nomor_surat_button" class="btn btn-xs btn-default" data-toggle="collapse" data-target="#nomor_surat_id"><i class="fa fa-plus"></i> Tambah Nomor Surat</button>
                            </div>
                            <div class="form-group collapse" id="tambah_penerima_id"">
                                <label>Tambah Penerima Baru: <?php echo form_error('tanggal') ?></label>
                                <select class=" form-control select2" name="kepada[]" multiple="multiple">
                                <?php foreach ($timeline_get_kepada as $lk) : ?>
                                    <option value="<?php echo $lk['id'] ?>"><?php echo $lk['first_name'] ?> <?php echo $lk['last_name'] ?> (<?php echo $lk['jabatan'] ?>)</option>

                                <?php endforeach ?>

                                </select>
                            </div>
                            <div class="form-group" hidden>
                                <label for="date">Kepada<sup>*</sup> <?php echo form_error('tanggal') ?></label>
                                <select class="form-control select2" required="true" name="kepada[]" multiple="multiple">
                                    <?php if ($timeline_u) : ?>
                                        <?php foreach ($timeline_u as $lu) : ?>
                                            <?php if ($lu['id_penerima'] == $_SESSION['user_id']) : ?>

                                                <option value="<?php echo $lu['id_pengirim'] ?>" selected><?php echo $lu['nd'] ?> <?php echo $lu['nb'] ?> (<?php echo $lu['jbtn'] ?>)</option>

                                            <?php endif ?>
                                        <?php endforeach ?>
                                    <?php endif ?>
                                </select>
                            </div>
                            <div class="form-group collapse" id="nomor_surat_id">
                                <label for="varchar">Nomor Surat</label>
                                <input type="text" class="form-control" name="nomor_surat" id="nomor_surat" placeholder="Nomor Surat" />
                            </div>
                            <div class="form-group">
                                <label for="varchar">Isi Surat<sup>*</sup> <?php echo form_error('isi_surat') ?></label>
                                <textarea name="isi_surat" required="true" class="textarea" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                <!-- <textarea name="isi_surat"></textarea>
                                <script>
                                    tinymce.init({
                                        selector: 'textarea',
                                        plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
                                        toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
                                        toolbar_mode: 'floating',
                                        tinycomments_mode: 'embedded',
                                        tinycomments_author: 'Author name'
                                    });
                                </script> -->
                            </div>

                            <!-- tombol selesai khusus pengirim -->
                            <!-- <?php if ($_SESSION['user_id'] == $pengirim->id_pengirim) : ?>
                                <div class="form-group">
                                    <input class="form-check-input" type="checkbox" value="1" name="status_surat" id="status_surat">
                                    <label class="form-check-label" for="defaultCheck1">
                                        Selesai? Jika anda mencentang ini artinya surat dinyatakan selesai dan tidak bisa dibalas lagi.
                                    </label>
                                </div>
                            <?php endif ?> -->

                            <div class="form-group">
                                <label for="varchar">File Attachment <?php echo form_error('lampiran') ?></label>
                                <input type="file" class="form-control-file" name="attachment[]" id="attachment" onchange="validationFileUpload(this)" />
                            </div>
                            <div id="moreUploads"></div>
                            <div id="moreUploadsLink" style="display:none;"><a href="javascript:addFileInput();">Tambah Attachment File</a><br><br></div>

                            <input type="hidden" name="id" value="<?php echo $id; ?>" />
                            <?php if ($status == 1) : ?>
                                <button type="submit" class="btn btn-primary" disabled>Kirim</button>
                            <?php else : ?>
                                <button type="submit" class="btn btn-primary">Kirim</button>
                            <?php endif ?>
                            <a href="<?php echo site_url('surat') ?>" class="btn btn-default">Cancel</a>

                        </div>
                        <div class="col-lg-4">
                            <h4>Keterangan</h4>
                            <ul>
                                <li>Yang diberi tanda bintang wajib diisi</li>
                                <li>Jika upload file ingin dihapus, klik lagi upload file, kemudian pilih Cancel</li>
                            </ul>
                        </div>
                        <?= form_close(); ?>
                    </div>
                </div>

                </div>
            </div>
    </div>

    </li>

    <li>
        <i class="fa fa-clock-o bg-gray"></i>
    </li>
    </ul>
</div>
</div> <!-- Add attachment file -->
<script type="text/javascript">
    var upload_number = 2;

    function addFileInput() {
        var d = document.createElement("div");
        var file = document.createElement("input");
        file.setAttribute("type", "file");
        file.setAttribute("name", "attachment[]");
        file.setAttribute("id", "attachment");
        d.appendChild(file);
        document.getElementById("moreUploads").appendChild(d);
        upload_number++;
    }

    var _validFileExtensions = [".jpg", ".jpeg", ".doc", ".gif", ".png", "docx", "pdf", "xls", "xlsx", "ppt", "pptx", "zip", "rar"];

    function validationFileUpload(oInput) {
        if (oInput.type == "file") {
            var sFileName = oInput.value;
            if (sFileName.length > 0) {
                var blnValid = false;
                for (var j = 0; j < _validFileExtensions.length; j++) {
                    var sCurExtension = _validFileExtensions[j];
                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                        blnValid = true;
                        break;
                    }
                }

                if (!blnValid) {
                    alert("Sorry, " + sFileName + " File Ekstensi Salah, hanya mengijinkan file: " + _validFileExtensions.join(", "));
                    oInput.value = "";
                    return false;
                }
            }
        }
        document.getElementById('moreUploadsLink').style.display = 'block';
        return true;
    }
</script>


<!-- lampiran -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->


<script>
    function uploadFile() {
        var file = document.getElementById("attachment").files[0];
        var formdata = new FormData();
        formdata.append("file_nya", file);
        var ajax = new XMLHttpRequest();
        ajax.upload.addEventListener("progress", progressUpload, false);
        ajax.open("POST", "<?php echo site_url('surat/read_action'); ?>", true);
        ajax.send(formdata);
    }

    function progressUpload(event) {
        var percent = (event.loaded / event.total) * 100;
        document.getElementById("progress-bar").style.width = Math.round(percent) + '%';
        document.getElementById("status").innerHTML = Math.round(percent) + "%";
        if (event.loaded == event.total) {
            window.location.href = '<?php echo base_url('surat/read/') . $id; ?>';
        }
    };
    // $("#balas_button").click(function() {
    //     $('#balas_form').toggle("slow");
    // });
    // $("#agenda_button").click(function() {
    //     $('#agenda_form').toggle("slow");
    // });
</script>
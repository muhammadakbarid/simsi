<script src="<?= base_url('assets/js/tinymce.min.js'); ?>" referrerpolicy="origin"></script>
<div class="row">
    <div class="col-xs-12 col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= $button; ?> Surat</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" onclick="location.reload()" title="Collapse">
                        <i class="fa fa-refresh"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?= form_open_multipart('surat/create_action'); ?>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="date">Tanggal Surat<sup>*</sup> <?php echo form_error('tanggal') ?></label>
                                    <input type="text" class="form-control formdate" name="tanggal" id="tanggal" required="true" placeholder="Tanggal" value="<?php echo $tanggal; ?>" />
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <label for="varchar">Nomor Surat<sup>*</sup> <?php echo form_error('nomor_surat') ?></label>
                                    <input type="text" class="form-control" name="nomor_surat" id="nomor_surat" required="true" placeholder="Nomor Surat" value="<?php echo $nomor_surat; ?>" />
                                </div>
                            </div>
                            <!-- <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="varchar">Lampiran <?php echo form_error('lampiran') ?></label>
                                    <input type="text" class="form-control" name="lampiran" id="lampiran" placeholder="Lampiran" value="<?php echo $lampiran; ?>" />
                                </div>
                            </div> -->
                        </div>

                        <div class="form-group">
                            <label for="date">Kepada<sup>*</sup> <?php echo form_error('tanggal') ?></label>
                            <select class="form-control select2" required="true" name="kepada[]" multiple="multiple">
                                <?php if ($list_user) : ?>
                                    <?php foreach ($list_user as $lu) : ?>
                                        <?php if ($list_permission) : ?>
                                            <?php foreach ($list_permission as $lp) : ?>
                                                <?php if ($lp->id_user == $lu->id) : ?>
                                                    <?php $tampil = true; ?>
                                                <?php else : ?>
                                                    <?php $tampil = false; ?>
                                                <?php endif ?>
                                            <?php endforeach ?>
                                        <?php endif ?>
                                        <?php if ($tampil == false) : ?>
                                            <option value="<?php echo $lu->id ?>"><?php echo $lu->first_name ?> <?php echo $lu->last_name ?> (<?php echo $lu->jabatan ?>)</option>
                                        <?php endif ?>
                                    <?php endforeach ?>
                                <?php endif ?>
                            </select>
                        </div>
                        <?php if ($this->ion_auth->in_group(29)) : ?>
                            <div class="form-group">
                                <label>
                                    Jenis Surat :</label>
                                <select class="form-control" name="jenis_surat" id="jenis_surat">
                                    <option value="internal">Internal</option>
                                    <option value="eksternal">Eksternal</option>
                                </select>
                            </div>
                        <?php endif ?>
                        <div class="form-group">
                            <label for="varchar">Perihal<sup>*</sup> <?php echo form_error('perihal') ?></label>
                            <input type="text" class="form-control" name="perihal" id="perihal" placeholder="Perihal" required="true" value="<?php echo $perihal; ?>" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Isi Surat<sup>*</sup> <?php echo form_error('isi_surat') ?></label>
                            <textarea name="isi_surat" required="true" class="textarea" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><?php echo $isi_surat; ?></textarea>

                        </div>
                        <!--
                        <div class="form-group">
                            <label for="varchar">Nomor Agenda <?php echo form_error('nomor_agenda') ?></label>
                            <input type="text" class="form-control" name="nomor_agenda" id="nomor_agenda" placeholder="Nomor Agenda" value="<?php echo $nomor_agenda; ?>" />
                        </div>
                        <div class="form-group">
                            <label for="date">Tgl Agenda <?php echo form_error('tgl_agenda') ?></label>
                            <input type="text" class="form-control formdate" name="tgl_agenda" id="tgl_agenda" placeholder="Tgl Agenda" value="<?php echo $tgl_agenda; ?>" />
                            </?php>
                        </div>
                        -->
                        <div class="form-group">
                            <label for="varchar">File Attachment <?php echo form_error('lampiran') ?></label>
                            <input type="file" class="form-control-file" name="attachment[]" id="attachment" onchange="validationFileUpload(this)" />
                        </div>
                        <div id="moreUploads"></div>
                        <div id="moreUploadsLink" style="display:none;"><a href="javascript:addFileInput();">Tambah Attachment File</a><br><br></div>
                        <!--
                        <div class="progress">
                            <div class="progress-bar" id="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                <span id="status"></span>
                            </div>
                        </div>
                        -->

                        <div class="form-group">
                            <label for="date">Tembusan Kepada <?php echo form_error('tembusan') ?></label>
                            <select class="form-control select2" name="tembusan[]" multiple="multiple">
                                <?php if ($list_user) : ?>
                                    <?php foreach ($list_user as $lu) : ?>
                                        <option value="<?php echo $lu->id ?>"><?php echo $lu->first_name ?> <?php echo $lu->last_name ?> (<?php echo $lu->jabatan ?>)</option>
                                    <?php endforeach ?>
                                <?php endif ?>
                            </select>
                        </div>


                        <input type="hidden" name="id" value="<?php echo $id; ?>" />
                        <button type="submit" class="btn btn-primary"><?php echo $button ?></button>
                        <a href="<?php echo site_url('surat') ?>" class="btn btn-default">Cancel</a>

                    </div>
                    <div class="col-lg-4">
                        <h4>Keterangan</h4>
                        <ul>
                            <li>Yang diberi tanda bintang wajib diisi</li>
                            <li>Jika upload file ingin dihapus, klik lagi upload file, kemudian pilih Cancel</li>
                        </ul>
                    </div>



                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add attachment file -->
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
            ajax.open("POST", "<?php echo site_url('surat/create_action'); ?>", true);
            ajax.send(formdata);
        }

        function progressUpload(event) {
            var percent = (event.loaded / event.total) * 100;
            document.getElementById("progress-bar").style.width = Math.round(percent) + '%';
            document.getElementById("status").innerHTML = Math.round(percent) + "%";
            if (event.loaded == event.total) {
                window.location.href = '<?php echo base_url('surat'); ?>';
            }
        }
    </script>
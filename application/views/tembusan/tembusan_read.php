<div class="row">
    <div class="col-xs-12 col-md-12">
        <form action="<?php echo site_url('surat/agenda_action'); ?>" method="post" id="formbulk">

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

                            <?php if ($status == 1) : ?>
                                <span class="bg-green">
                                <?php else : ?>
                                    <span class="bg-yellow">
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

                                    <?php if ($this->ion_auth->in_group(29) and (empty($nomor_agenda))) : ?>
                                        <input type="checkbox" class="fa bg-blue" name="filter_surat[]" value="<?= $t['id_tujuan']; ?>">
                                    <?php else : ?>
                                        <i class="fa fa-<?php echo ($i == 1 ? "envelope" : "reply") ?> bg-blue"></i>
                                    <?php endif ?>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i> <?= timeAgo($post_date); ?></span>
                                        <small class="time"></small>
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
                                            <?php endif ?>
                                            <?php if ($t['isi']) : ?>
                                                <?= $t['isi']; ?>
                                            <?php else : ?>
                                                <?= $t['isi_surat']; ?>
                                            <?php endif ?>
                                            <hr>

                                        </div>
                                        <div class="timeline-footer">
                                            <?php if ($i == 1) : ?>
                                                <hr>
                                                <strong>File Attachment:</strong><br>
                                                <?php $j = 1; ?>
                                                <?php foreach ($timeline_l as $l) : ?>
                                                    <?php echo $j ?>. <a href="<?= base_url('upload/surat-internal/') . $l->file_surat; ?>" target="_blank"><?= $l->file_surat; ?></a><br>
                                                    <?php $j++; ?>
                                                <?php endforeach ?>
                                            <?php else : ?>
                                                <?php $lampiran_tujuan = $this->MSuratLampiran->get_by_id_tujuan($t['id_tujuan']); ?>
                                                <?php if ($lampiran_tujuan) : ?>
                                                    <hr>
                                                    <strong>File Attachment:</strong><br>
                                                    <?php $m = 1; ?>
                                                    <?php foreach ($lampiran_tujuan as $lt) : ?>
                                                        <?php echo $m ?>. <a href="<?= base_url('upload/surat-internal/') . $lt->file_surat; ?>" target="_blank"><?= $lt->file_surat; ?></a><br>
                                                        <?php $m++; ?>
                                                    <?php endforeach ?>
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
                                            <div>
                                                <a href="<?= base_url('surat/print/') . $id; ?>" target="_blank" type="button" class="btn btn-default"><i class="fa fa-print"></i> Print Surat</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <i class="fa fa-clock-o bg-gray"></i>
                                </li>
            </ul>
        </form>



    </div>
</div>
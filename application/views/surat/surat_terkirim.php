<style>
    .table-row {
        cursor: pointer;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Surat</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" onclick="location.reload()" title="Refresh">
                        <i class="fa fa-refresh"></i></button>
                </div>
            </div>

            <div class="box-body">
                <!-- <div class="mailbox-messages"> -->
                <div class="row" style="margin-bottom: 10px">
                    <div class="col-md-4">
                        <?php echo anchor(site_url('surat/create'), '<i class="fa fa-plus"></i> Tulis Surat', 'class="btn btn-sm btn-primary"'); ?>
                    </div>
                    <div class="col-md-4 text-center">
                        <div style="margin-top: 8px" id="message">

                        </div>
                    </div>
                    <div class="col-md-1 text-right">
                    </div>
                    <div class="col-md-3 text-right">
                        <form action="<?php echo site_url($search_page); ?>" class="form-inline" method="get" style="margin-top:10px">
                            <div class="input-group">
                                <input type="text" class="form-control" name="q" value="<?php echo $q; ?>">
                                <span class="input-group-btn">
                                    <?php
                                    if ($q <> '') {
                                    ?>
                                        <a href="<?php echo site_url($search_page); ?>" class="btn btn-default">Reset</a>
                                    <?php
                                    }
                                    ?>
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <form method="post" action="<?= site_url('surat/deletebulk'); ?>" id="formbulk">
                    <div class="mailbox-messages">
                        <table class="table table-hover" style="margin-bottom: 10px" style="width:100%">
                            <tr>
                                <!-- <th style="width: 10px;"><input type="checkbox" name="selectall" /></th> -->
                                <th>
                                    <center>No</center>
                                </th>
                                <th>Penerima</th>
                                <th>Perihal</th>
                                <th>Nomor Surat</th>
                                <th>Waktu Kirim</th>
                                <th>Status</th>
                                <!-- <th>Action</th> -->
                            </tr>
                            <?php
                            foreach ($surat_data as $surat) :
                            ?>
                                <?php $a = site_url('surat/read/') . $surat->id;
                                $surat_link = "class='table-row' data-href='$a'" ?>
                                <?php if ($surat->status == 1) : ?>
                                    <tr>
                                    <?php elseif ($surat->status_tujuan == 0) : ?>
                                    <tr class="bg-danger">
                                    <?php else : ?>
                                    <tr class=" bg-warning">
                                    <?php endif ?>

                                    <!-- <td style="width: 10px;padding-left: 8px;"><input type="checkbox" name="id" value="<?= $surat->id; ?>" />&nbsp;</td> -->

                                    <td <?= $surat_link; ?>>
                                        <center><?php echo ++$start ?></center>
                                    </td>
                                    <td <?= $surat_link; ?>><strong><?php echo $surat->nama_depan . " " . $surat->nama_belakang ?></strong></td>
                                    <td <?= $surat_link; ?>>
                                        <b><?php echo $surat->perihal ?></b>
                                    </td>
                                    <td <?= $surat_link; ?>><?php echo $surat->nomor_surat ?></td>

                                    <td <?= $surat_link; ?>><?php echo timeAgo($surat->post_date) ?></td>
                                    <td <?= $surat_link; ?>>
                                        <?php if ($surat->status == "0") : ?>
                                            <span class="label label-warning">On Progress</span>
                                        <?php else : ?>
                                            <span class="label label-success">Selesai</span>
                                        <?php endif ?>
                                    </td>
                                    <!-- <td style="text-align:center">
                                        <?php
                                        // echo anchor(site_url('surat/read/' . $surat->id), '<i class="fa fa-search"></i>', 'class="btn btn-xs btn-primary"  data-toggle="tooltip" title="Detail"');
                                        // echo ' ';
                                        echo anchor(site_url('surat/delete/' . $surat->id), ' <i class="fa fa-trash"></i>', 'class="btn btn-xs btn-danger" onclick="javasciprt: return confirmdelete(\'surat/delete/' . $surat->id . '\')"  data-toggle="tooltip" title="Delete" ');
                                        ?>
                                    </td> -->
                                    </tr>
                                <?php endforeach ?>

                        </table>
                    </div>

                </form>
                <div class="row">
                    <div class="col-md-6">
                        <a href="#" class="btn bg-yellow">Total Record : <?php echo $total_rows ?></a>
                    </div>
                    <div class="col-md-6 text-right">
                        <?php echo $pagination ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function confirmdelete(linkdelete) {
        alertify.confirm("Apakah anda yakin akan  menghapus data tersebut?", function() {
            location.href = linkdelete;
        }, function() {
            alertify.error("Penghapusan data dibatalkan.");
        });
        $(".ajs-header").html("Konfirmasi");
        return false;
    }
    $(':checkbox[name=selectall]').click(function() {
        $(':checkbox[name=id]').prop('checked', this.checked);
    });

    $("#formbulk").on("submit", function() {
        var rowsel = [];
        $.each($("input[name='id']:checked"), function() {
            rowsel.push($(this).val());
        });
        if (rowsel.join(",") == "") {
            alertify.alert('', 'Tidak ada data terpilih!', function() {});

        } else {
            var prompt = alertify.confirm('Apakah anda yakin akan menghapus data tersebut?',
                'Apakah anda yakin akan menghapus data tersebut?').set('labels', {
                ok: 'Yakin',
                cancel: 'Batal!'
            }).set('onok', function(closeEvent) {

                $.ajax({
                    url: "surat/deletebulk",
                    type: "post",
                    data: "msg = " + rowsel.join(","),
                    success: function(response) {
                        if (response == true) {
                            location.reload();
                        }
                        //console.log(response);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });

            });
            $(".ajs-header").html("Konfirmasi");
        }
        return false;
    });
    $(document).ready(function($) {
        $(".table-row").click(function() {
            window.document.location = $(this).data("href");
        });
    });
</script>
<!-- Page Script -->
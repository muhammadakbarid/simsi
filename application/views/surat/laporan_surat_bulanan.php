<?php foreach ($surat_data as $g) {
    // var_dump($grafik);
    // exit;
    $y[] = bulan_surat($g->Tanggal);
    $x[] = $g->Jumlah_Surat;
} ?>
<style>
    .table-row {
        cursor: pointer;
    }

    .ui-datepicker-calendar {
        display: none;
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
                <div class="row" style="margin-bottom: 10px">

                    <div class="col-md-8 text-center">
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
                                        <a href="<?php echo site_url('surat/laporan_surat_bulanan'); ?>" class="btn btn-default">Reset</a>
                                    <?php
                                    }
                                    ?>
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div style="margin-bottom: 10px;margin-left:10px;margin-top:60px"><label for="filter">Filter Tanggal:</label></div>
                <div class="row" style="margin-bottom: 10px;margin-left:10px">
                    <form action="<?php echo base_url('surat/laporan_surat_bulanan'); ?>" class="form-inline" method="post">
                        <div class="col input-group">
                            <!-- <label><b>Filter :</b></label> -->
                            <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></button></span>
                            <input type="text" class="form-control formdate2" name="dari" id="DariTanggal" required="true" placeholder="Dari Bulan">
                        </div>
                        <div class="col input-group">
                            <span class="input-group-addon" id="sizing-addon1">
                                <i class="fas fa-chevron-right"></i></span>
                            <input type="text" class="form-control formdate2" name="sampai" id="SampaiTanggal" required="true" placeholder="Sampai Bulan">
                        </div>
                        <div class="col input-group">
                            <button type="submit" class="btn btn-primary"> <i class="fas fa-check-circle"></i> Submit</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="pull-left header"><i class="fa fa-inbox"></i> Statistik Surat</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <canvas id="myChart" width="200" height="100"></canvas>
                            <script>
                                var ctx = document.getElementById('myChart');
                                var myChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {
                                        labels: <?= json_encode($y); ?>,
                                        datasets: [{
                                            label: '# Surat dibuat',
                                            data: <?= json_encode($x); ?>,
                                            backgroundColor: [
                                                'rgba(255, 99, 132, 0.2)',
                                                'rgba(54, 162, 235, 0.2)',
                                                'rgba(255, 206, 86, 0.2)',
                                                'rgba(75, 192, 192, 0.2)',
                                                'rgba(153, 102, 255, 0.2)',
                                                'rgba(255, 159, 64, 0.2)'
                                            ],
                                            borderColor: [
                                                'rgba(255, 99, 132, 1)',
                                                'rgba(54, 162, 235, 1)',
                                                'rgba(255, 206, 86, 1)',
                                                'rgba(75, 192, 192, 1)',
                                                'rgba(153, 102, 255, 1)',
                                                'rgba(255, 159, 64, 1)'
                                            ],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            y: {
                                                beginAtZero: true
                                            }
                                        }
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <form method="post" action="<?= site_url('surat/deletebulk'); ?>" id="formbulk">
                        <div class="mailbox-messages">
                            <table class="table table-hover" style="margin-bottom: 10px" style="width:100%">
                                <tr>
                                    <!-- <th style="width: 10px;"><input type="checkbox" name="selectall" /></th> -->
                                    <th>
                                        <center>No</center>
                                    </th>
                                    <th>Tanggal</th>
                                    <th>Jumlah Surat</th>
                                    <!-- <th>Action</th> -->
                                </tr>
                                <?php
                                foreach ($surat_data as $surat) :
                                ?>


                                    <td>
                                        <center><?php echo ++$start ?></center>
                                    </td>
                                    <td><strong><?php echo bulan_surat($surat->Tanggal) ?></strong></td>
                                    <td>
                                        <b><?php echo $surat->Jumlah_Surat ?></b>
                                    </td>


                                    </td>

                                    </tr>
                                <?php endforeach ?>

                            </table>
                        </div>

                    </form>
                </div>


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
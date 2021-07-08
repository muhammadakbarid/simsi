<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <h2>View_surat List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id Surat</th>
		<th>Nomor Surat</th>
		<th>Tanggal Surat</th>
		<th>Perihal</th>
		
            </tr><?php
            foreach ($view_surat_data as $view_surat)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $view_surat->id_surat ?></td>
		      <td><?php echo $view_surat->Nomor_Surat ?></td>
		      <td><?php echo $view_surat->Tanggal_Surat ?></td>
		      <td><?php echo $view_surat->Perihal ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
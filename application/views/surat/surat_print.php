<!DOCTYPE html>
<html>

<head>
  <title>Tittle</title>
  <style type="text/css" media="print">
    @page {
      margin: 0;
      /* this affects the margin in the printer settings */
    }

    table {
      border-collapse: collapse;
      border-spacing: 0;
      width: 100%;
    }

    table th {
      -webkit-print-color-adjust: exact;
      border: 1px solid;

      padding-top: 11px;
      padding-bottom: 11px;
      background-color: #a29bfe;
    }

    table td {
      border: 1px solid;

    }
  </style>
</head>

<body>
  <h3 align="center">DATA Surat</h3>
  <h4>Tanggal Cetak : <?= date("d/M/Y"); ?> </h4>
  <table class="word-table" style="margin-bottom: 10px">
    <tr>
      <th>No</th>
      <th>Tanggal</th>
      <th>Nomor Surat</th>
      <th>Lampiran</th>
      <th>Perihal</th>
      <th>Nomor Agenda</th>
      <th>Tgl Agenda</th>
      <th>Post Date</th>
      <th>Status</th>

    </tr><?php
          foreach ($surat_data as $surat) {
          ?>
      <tr>
        <td><?php echo ++$start ?></td>
        <td><?php echo $surat->tanggal ?></td>
        <td><?php echo $surat->nomor_surat ?></td>
        <td><?php echo $surat->lampiran ?></td>
        <td><?php echo $surat->perihal ?></td>
        <td><?php echo $surat->nomor_agenda ?></td>
        <td><?php echo $surat->tgl_agenda ?></td>
        <td><?php echo $surat->post_date ?></td>
        <td><?php echo $surat->status ?></td>
      </tr>
    <?php
          }
    ?>
  </table>
</body>
<script type="text/javascript">
  window.print()
</script>

</html>
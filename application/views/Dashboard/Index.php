<?php if ($jml_surat_unread > 0) : ?>
  <div class="alert alert-danger">
    Ada <strong><?= $jml_surat_unread; ?></strong> surat belum dibaca. <a href="<?= base_url('surat/unread'); ?>">Cek Surat</a>
  </div>
<?php elseif ($jml_surat_diproses > 0) : ?>
  <div class="alert alert-warning">
    Ada <strong><?= $jml_surat_diproses; ?></strong> surat masih diproses. <a href="<?= base_url('surat/diproses'); ?>">Cek Surat</a>
  </div>
<?php elseif ($jml_surat_selesai > 0) : ?>
  <div class="alert alert-success">
    Ada <strong><?= $jml_surat_selesai; ?></strong> surat telah selesai. <a href="<?= base_url('surat/selesai'); ?>">Cek Surat</a>
  </div>
<?php endif ?>
<style>
  .infobox {
    position: relative;
  }

  .overlay {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
    width: 100%;
    opacity: 0;
    transition: .5s ease;
    background-color: #000;
  }

  .infobox:hover .overlay {
    opacity: 0.3;
    transition: .5s ease;
  }
</style>
<!-- Default box -->
<div class="row">
  <div class="col-md-3 col-sm-6 col-xs-12 ">
    <a href="<?= base_url('surat'); ?>">
      <div class="info-box bg-aqua infobox">

        <span class="info-box-icon"><i class="fa fa-envelope"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Masuk</span>
          <span class="info-box-number"><?= $jml_surat_masuk; ?></span>

          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
          <span class="progress-description">
            Total Surat Masuk
          </span>
          <div class="overlay"></div>
        </div>
        <!-- /.info-box-content -->
      </div>
  </div>
  </a>
  <!-- /.info-box -->
  <a href="<?= base_url('surat/unread'); ?>">
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-red infobox">
        <span class="info-box-icon"><i class="fa fa-envelope"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">BELUM DIBACA</span>
          <span class="info-box-number"><?= $jml_surat_unread; ?></span>

          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
          <span class="progress-description">
            Total surat yang belum di baca
          </span>
          <div class="overlay"></div>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
  </a>
  <!-- /.col -->
  <a href="<?= base_url('surat/diproses'); ?>">

    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-yellow infobox">
        <span class="info-box-icon"><i class="fa fa-refresh"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Masih Diproses</span>
          <span class="info-box-number"><?= $jml_surat_diproses; ?></span>

          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
          <span class="progress-description">
            Total Surat Yang Masih diproses
          </span>
          <div class="overlay"></div>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
  </a>
  <a href="<?= base_url('surat/selesai'); ?>">
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-green infobox">
        <span class="info-box-icon"><i class="fa fa-check"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Selesai</span>
          <span class="info-box-number"><?= $jml_surat_selesai; ?></span>

          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
          <span class="progress-description">
            Total surat yang telah selesai
          </span>
          <div class="overlay"></div>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
  </a>
</div>
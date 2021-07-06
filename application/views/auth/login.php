<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title><?= $title; ?></title>

  <!-- Custom fonts for this template-->
  <link href="<?= base_url('assets/'); ?>css/all.min.css" rel="stylesheet" type="text/css">
  <link href=https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/bower_components/fontawesome/css/all.min.css">
  <!-- Custom styles for this template-->
  <link href="<?= base_url('assets/'); ?>css/sb-admin-2.min.css" rel="stylesheet">
  <style>
    #auth {
      background: #6c757d;
      min-height: 100vh;
      padding-top: 100px;
      background-image: url(<?= base_url('assets/'); ?>img/background/auth.jpg)
    }


    #auth .card {
      box-shadow: 0 5px 15px rgba(36, 104, 146, 0.6);
      border: none;
    }
  </style>
</head>

<body class="bg-gradient-primary">
  <div id="auth">
    <div class="container">

      <!-- Outer Row -->
      <div class="row justify-content-center">

        <div class="col-lg-7">

          <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
              <!-- Nested Row within Card Body -->
              <div class="row">
                <div class="col-lg">
                  <div class="p-5">
                    <div class="text-center">
                      <h1 class="h4 text-gray-900 mb-4">Login Page</h1>
                    </div>
                    <?= $this->session->flashdata('success'); ?>
                    <form class="user" method="post" action="<?= base_url('auth/login'); ?>">
                      <div class="form-group has-feedback">
                        <input type="text" class="form-control form-control-user" id="identity" name="identity" placeholder="<?php echo lang('login_identity_label') ?>" autofocus>
                        <?= form_error('identity', '<small class="text-danger pl-3">', '</small>'); ?>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <input type="password" class="form-control form-control-user" id="password" placeholder="<?php echo lang('login_password_label') ?>" name="password" data-toggle="password">
                          <div class="input-group-append">
                            <span class="input-group-text bg-light form-control form-control-user"><i class="fa fa-eye" style="color: black;"></i></span>
                          </div>
                        </div>

                        <?= form_error('password', '<small class="text-danger pl-3">', '</small>'); ?>
                      </div>

                      <button type="submit" class="btn btn-primary btn-user btn-block">
                        Login
                      </button>


                    </form>
                    <hr>

                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>

    </div>
  </div>
  <!-- Bootstrap core JavaScript-->

  <script src="<?= base_url('assets/'); ?>js/jquery.min.js"></script>
  <script src="<?= base_url('assets/'); ?>js/bootstrap.bundle.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<?= base_url('assets/'); ?>js/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script>
  <script src="<?= base_url(); ?>assets/plugins/bootstrap-show-password/bootstrap-show-password.js"></script>


</body>

</html>
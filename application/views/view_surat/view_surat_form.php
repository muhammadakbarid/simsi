<div class="row">
    <div class="col-xs-12 col-md-6">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= $button;?> View_surat</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
                    <i class="fa fa-minus"></i></button>
                     <button type="button" class="btn btn-box-tool" onclick="location.reload()" title="Collapse">
              <i class="fa fa-refresh"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
        <form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="int">Id Surat <?php echo form_error('id_surat') ?></label>
            <input type="text" class="form-control" name="id_surat" id="id_surat" placeholder="Id Surat" value="<?php echo $id_surat; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Nomor Surat <?php echo form_error('Nomor_Surat') ?></label>
            <input type="text" class="form-control" name="Nomor_Surat" id="Nomor_Surat" placeholder="Nomor Surat" value="<?php echo $Nomor_Surat; ?>" />
        </div>
	    <div class="form-group">
            <label for="date">Tanggal Surat <?php echo form_error('Tanggal_Surat') ?></label>
            <input type="text" class="form-control" name="Tanggal_Surat" id="Tanggal_Surat" placeholder="Tanggal Surat" value="<?php echo $Tanggal_Surat; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Perihal <?php echo form_error('Perihal') ?></label>
            <input type="text" class="form-control" name="Perihal" id="Perihal" placeholder="Perihal" value="<?php echo $Perihal; ?>" />
        </div>
	    <input type="hidden" name="" value="<?php echo $; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('view_surat') ?>" class="btn btn-default">Cancel</a>
	</form>
         </div>
        </div>
    </div>
</div>
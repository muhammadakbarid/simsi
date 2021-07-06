<div class="row">
    <div class="col-xs-12 col-md-6">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= $button;?> Surat_lampiran</h3>
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
            <label for="int">Id Tujuan <?php echo form_error('id_tujuan') ?></label>
            <input type="text" class="form-control" name="id_tujuan" id="id_tujuan" placeholder="Id Tujuan" value="<?php echo $id_tujuan; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">File Surat <?php echo form_error('file_surat') ?></label>
            <input type="text" class="form-control" name="file_surat" id="file_surat" placeholder="File Surat" value="<?php echo $file_surat; ?>" />
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('suratlampiran') ?>" class="btn btn-default">Cancel</a>
	</form>
         </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-md-6">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= $button;?> Tujuan</h3>
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
            <label for="int">Dari <?php echo form_error('dari') ?></label>
            <input type="text" class="form-control" name="dari" id="dari" placeholder="Dari" value="<?php echo $dari; ?>" />
        </div>
	    <div class="form-group">
            <label for="int">Kepada <?php echo form_error('kepada') ?></label>
            <input type="text" class="form-control" name="kepada" id="kepada" placeholder="Kepada" value="<?php echo $kepada; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Post Date <?php echo form_error('post_date') ?></label>
            <input type="text" class="form-control" name="post_date" id="post_date" placeholder="Post Date" value="<?php echo $post_date; ?>" />
        </div>
	    <div class="form-group">
            <label for="enum">Status <?php echo form_error('status') ?></label>
            <input type="text" class="form-control" name="status" id="status" placeholder="Status" value="<?php echo $status; ?>" />
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('tujuan') ?>" class="btn btn-default">Cancel</a>
	</form>
         </div>
        </div>
    </div>
</div>
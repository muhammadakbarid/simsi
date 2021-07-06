<!-- <?php var_dump($users_groups) ?> -->
<div class="row">
    <div class="col-xs-12 col-md-6">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= $button; ?> Permission</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" onclick="location.reload()" title="Collapse">
                        <i class="fa fa-refresh"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form action="<?php echo $action; ?>" method="post">
                    <div class="form-group">
                        <label for="int">From <?php echo form_error('id_groups') ?></label>
                        <select name="id_groups" id="id_groups" class="form-control">
                            <?php if ($id) : ?>
                                <option value="<?php echo $id_groups; ?>" selected><?php echo $id_groups; ?></option>
                            <?php else : ?>
                                <option value="">-- Dari --</option>
                            <?php endif ?>
                            <?php foreach ($users_groups as $u) : ?>
                                <option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <!-- <div class="form-group">Blacklist</div> -->
                    <div class="form-group">
                        <label for="int">To <?php echo form_error('id_groups_to') ?></label>
                        <select name="id_groups_to" id="id_groups_to" class="form-control">
                            <?php if ($id) : ?>
                                <option value="<?php echo $id_groups_to; ?>" selected><?php echo $id_groups_to; ?></option>
                            <?php else : ?>
                                <option value="">-- Kepada --</option>
                            <?php endif ?>
                            <?php foreach ($users_groups as $u) : ?>
                                <option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <input type="hidden" name="id" value="<?php echo $id; ?>" />
                    <button type="submit" class="btn btn-primary"><?php echo $button ?></button>
                    <a href="<?php echo site_url('permission') ?>" class="btn btn-default">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>
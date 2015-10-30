<?php

/**
 * @author: Dmitry Shkoliar @DrmitryNek
 * @project: maxcdn-opencart
 * @file: admin/view/template/module/maxcdn.tpl
 */
?>
<?php echo $header; ?>
<?php if (version_compare(VERSION, '2.0.0') < 0) { ?>
    <div id="content">
        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?>
                <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </div>
        <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
        <?php } ?>
        <div class="box">
            <div class="heading">
                <h1>
                    <img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?>
                </h1>
                <div class="buttons">
                    <a onclick="$('#form').submit();" class="button">
                        <span><?php echo $button_save; ?></span>
                    </a>
                    <a href="<?php echo $cancel; ?>" class="button">
                        <span><?php echo $button_cancel; ?></span>
                    </a>
                </div>
            </div>
            <div class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_status; ?></td>
                            <td>
                                <?php if($status) {
                                    $checked1 = ' checked="checked"';
                                    $checked0 = '';
                                } else {
                                    $checked1 = '';
                                    $checked0 = ' checked="checked"';
                                } ?>
                                <label for="status_1"><?php echo $text_enabled; ?></label>
                                <input type="radio"<?php echo $checked1; ?> id="status_1" name="status" value="1" />
                                <label for="status_0"><?php echo $text_disabled; ?></label>
                                <input type="radio"<?php echo $checked0; ?> id="status_0" name="status" value="0" />
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_domain; ?></td>
                            <td>
                                <input type="text" name="domain" size="60" value="<?php echo $domain; ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_images; ?></td>
                            <td><?php if ($images) { ?>
                                    <input type="radio" name="images" value="1" checked="checked"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="images" value="0"/>
                                    <?php echo $text_no; ?>
                                <?php } else { ?>
                                    <input type="radio" name="images" value="1"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="images" value="0" checked="checked"/>
                                    <?php echo $text_no; ?>
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_js; ?></td>
                            <td><?php if ($js) { ?>
                                    <input type="radio" name="js" value="1" checked="checked"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="js" value="0"/>
                                    <?php echo $text_no; ?>
                                <?php } else { ?>
                                    <input type="radio" name="js" value="1"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="js" value="0" checked="checked"/>
                                    <?php echo $text_no; ?>
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_css; ?></td>
                            <td><?php if ($css) { ?>
                                    <input type="radio" name="css" value="1" checked="checked"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="css" value="0"/>
                                    <?php echo $text_no; ?>
                                <?php } else { ?>
                                    <input type="radio" name="css" value="1"/>
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="css" value="0" checked="checked"/>
                                    <?php echo $text_no; ?>
                                <?php } ?>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
<?php } else { ?>
    <?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                            class="btn btn-primary">
                        <i class="fa fa-save"></i>
                    </button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default">
                        <i class="fa fa-reply"></i>
                    </a>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger">
                    <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                          id="form" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="status" id="input-status" class="form-control">
                                    <?php if ($status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input-domain"><?php echo $entry_domain; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="domain" placeholder="<?php echo $entry_domain; ?>"
                                       id="input-domain" value="<?php echo $domain; ?>" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_images; ?></label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <?php if ($images) { ?>
                                        <input type="radio" name="images" value="1" checked="checked"/>
                                        <?php echo $text_yes; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="images" value="1"/>
                                        <?php echo $text_yes; ?>
                                    <?php } ?>
                                </label>
                                <label class="radio-inline">
                                    <?php if (!$images) { ?>
                                        <input type="radio" name="images" value="0" checked="checked"/>
                                        <?php echo $text_no; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="images" value="0"/>
                                        <?php echo $text_no; ?>
                                    <?php } ?>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_js; ?></label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <?php if ($js) { ?>
                                        <input type="radio" name="js" value="1" checked="checked"/>
                                        <?php echo $text_yes; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="js" value="1"/>
                                        <?php echo $text_yes; ?>
                                    <?php } ?>
                                </label>
                                <label class="radio-inline">
                                    <?php if (!$js) { ?>
                                        <input type="radio" name="js" value="0" checked="checked"/>
                                        <?php echo $text_no; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="js" value="0"/>
                                        <?php echo $text_no; ?>
                                    <?php } ?>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_css; ?></label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <?php if ($css) { ?>
                                        <input type="radio" name="css" value="1" checked="checked"/>
                                        <?php echo $text_yes; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="css" value="1"/>
                                        <?php echo $text_yes; ?>
                                    <?php } ?>
                                </label>
                                <label class="radio-inline">
                                    <?php if (!$css) { ?>
                                        <input type="radio" name="css" value="0" checked="checked"/>
                                        <?php echo $text_no; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="css" value="0"/>
                                        <?php echo $text_no; ?>
                                    <?php } ?>
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
<?php echo $footer; ?>

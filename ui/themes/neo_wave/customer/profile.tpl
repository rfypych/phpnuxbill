{include file="customer/header.tpl"}

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">{Lang::T('My Account')}</div>
            <div class="panel-body">
                <form class="form-horizontal" enctype="multipart/form-data" method="post" role="form" action="{Text::url('accounts/edit-profile-post')}">
                    <input type="hidden" name="csrf_token" value="{$csrf_token}">
                    <input type="hidden" name="id" value="{$_user['id']}">

                    <div class="text-center mb-3">
                        <img src="{$app_url}/{$UPLOAD_PATH}{$_user['photo']}.thumb.jpg"
                             onerror="this.src='{$app_url}/{$UPLOAD_PATH}/user.default.jpg'"
                             class="img-circle" style="width: 120px; height: 120px; border: 3px solid var(--primary-color);"
                             alt="Profile Photo">
                        <br><br>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">{Lang::T('Photo')}</label>
                        <div class="col-md-9">
                            <input type="file" class="form-control" name="photo" accept="image/*" style="padding: 3px;">
                            <div class="checkbox">
                                <label><input type="checkbox" checked name="faceDetect" value="yes"> {Lang::T('Face Detect')}</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">{Lang::T('Username')}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" readonly value="{$_user['username']}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">{Lang::T('Full Name')}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="fullname" value="{$_user['fullname']}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">{Lang::T('Address')}</label>
                        <div class="col-md-9">
                            <textarea name="address" class="form-control" rows="3">{$_user['address']}</textarea>
                        </div>
                    </div>

                    {if $_c['allow_phone_otp'] != 'yes'}
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('Phone')}</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="phonenumber" value="{$_user['phonenumber']}">
                            </div>
                        </div>
                    {else}
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('Phone')}</label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <input type="text" class="form-control" readonly value="{$_user['phonenumber']}">
                                    <span class="input-group-btn">
                                        <a href="{Text::url('accounts/phone-update')}" class="btn btn-info">{Lang::T('Change')}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    {/if}

                    {if $_c['allow_email_otp'] != 'yes'}
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('Email')}</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email" value="{$_user['email']}">
                            </div>
                        </div>
                    {else}
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('Email')}</label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <input type="text" class="form-control" readonly value="{$_user['email']}">
                                    <span class="input-group-btn">
                                        <a href="{Text::url('accounts/email-update')}" class="btn btn-info">{Lang::T('Change')}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    {/if}

                    {$customFields}

                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-success btn-block" type="submit">{Lang::T('Save Changes')}</button>
                            <a href="{Text::url('home')}" class="btn btn-default btn-block" style="margin-top: 10px;">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
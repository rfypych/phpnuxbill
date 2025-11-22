{include file="customer/header.tpl"}

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">{Lang::T('Change Password')}</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" role="form" action="{Text::url('accounts/change-password-post')}">
                    <input type="hidden" name="csrf_token" value="{$csrf_token}">

                    <div class="form-group">
                        <label class="col-md-4 control-label">{Lang::T('Current Password')}</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control" name="password" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">{Lang::T('New Password')}</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control" name="npassword" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">{Lang::T('Confirm New Password')}</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control" name="cnpassword" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-8">
                            <button type="submit" class="btn btn-primary btn-block">{Lang::T('Save Changes')}</button>
                            <a href="{Text::url('home')}" class="btn btn-default btn-block" style="margin-top: 10px;">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
{include file="customer/header-public.tpl"}

<div class="login-box">
    <div class="row" style="display: flex; justify-content: center;">
        <div class="col-md-5">
            <div class="panel panel-primary">
                <div class="panel-heading">{Lang::T('Forgot Password')}</div>
                <div class="panel-body">
                    <form action="{Text::url('forgot/post')}" method="post">
                        <input type="hidden" name="csrf_token" value="{$csrf_token}">

                        <p class="text-muted text-center">{Lang::T('Enter your email or phone number to reset your password.')}</p>

                        <div class="form-group">
                            <label>{Lang::T('Email')} / {Lang::T('Phone Number')}</label>
                            <input type="text" class="form-control" name="email" placeholder="{Lang::T('Email')} / {Lang::T('Phone Number')}" required>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">{Lang::T('Reset Password')}</button>
                            <a href="{Text::url('login')}" class="btn btn-default btn-block">{Lang::T('Cancel')}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer-public.tpl"}
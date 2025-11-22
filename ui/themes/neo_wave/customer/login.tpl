{include file="customer/header-public.tpl"}

<div class="login-box">
    <div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 2rem;">
        <!-- Announcement Section -->
        <div class="col-md-6 col-sm-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <i class="fa fa-bullhorn"></i> {Lang::T('Announcement')}
                </div>
                <div class="panel-body">
                    {$Announcement = "{$PAGES_PATH}/Announcement.html"}
                    {if file_exists($Announcement)}
                        {include file=$Announcement}
                    {else}
                        <p>{Lang::T('No announcements at this time.')}</p>
                    {/if}
                </div>
            </div>
        </div>

        <!-- Login Form -->
        <div class="col-md-5 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading" style="text-align: center;">
                    <h3 style="margin: 0;">{Lang::T('Log in to Member Panel')}</h3>
                </div>
                <div class="panel-body">
                    <form action="{Text::url('login/post')}" method="post">
                        <input type="hidden" name="csrf_token" value="{$csrf_token}">

                        <div class="form-group">
                            <label>
                                {if $_c['registration_username'] == 'phone'}
                                    {Lang::T('Phone Number')}
                                {elseif $_c['registration_username'] == 'email'}
                                    {Lang::T('Email')}
                                {else}
                                    {Lang::T('Usernames')}
                                {/if}
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    {if $_c['registration_username'] == 'phone'}
                                        <i class="ion ion-android-phone-portrait"></i>
                                    {elseif $_c['registration_username'] == 'email'}
                                        <i class="ion ion-android-mail"></i>
                                    {else}
                                        <i class="ion ion-person"></i>
                                    {/if}
                                </span>
                                <input type="text" class="form-control" name="username"
                                    placeholder="{if $_c['country_code_phone']!= '' || $_c['registration_username'] == 'phone'}{$_c['country_code_phone']} {Lang::T('Phone Number')}{elseif $_c['registration_username'] == 'email'}{Lang::T('Email')}{else}{Lang::T('Usernames')}{/if}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>{Lang::T('Password')}</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="ion ion-locked"></i></span>
                                <input type="password" class="form-control" name="password" placeholder="{Lang::T('Password')}" required>
                            </div>
                        </div>

                        <div class="form-group" style="display: flex; gap: 10px;">
                            <button type="submit" class="btn btn-primary btn-block">{Lang::T('Login')}</button>
                            {if $_c['disable_registration'] != 'noreg'}
                                <a href="{Text::url('register')}" class="btn btn-success btn-block" style="margin-top: 0;">{Lang::T('Register')}</a>
                            {/if}
                        </div>

                        <div style="text-align: center; margin-top: 1rem;">
                            <a href="{Text::url('forgot')}">{Lang::T('Forgot Password')}</a>
                            <br><br>
                            <small>
                                <a href="javascript:showPrivacy()">Privacy</a> &bull; <a href="javascript:showTaC()">T&C</a>
                            </small>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer-public.tpl"}
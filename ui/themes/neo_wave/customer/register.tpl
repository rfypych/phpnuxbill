{include file="customer/header-public.tpl"}

<div class="login-box" style="max-width: 1000px;">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-info">
                <div class="panel-heading">{Lang::T('Registration Info')}</div>
                <div class="panel-body">
                    {include file="$_path/../pages/Registration_Info.html"}
                </div>
            </div>
        </div>

        <form enctype="multipart/form-data" action="{Text::url('register/post')}" method="post">
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">1. {Lang::T('Register as Member')}</div>
                    <div class="panel-body">
                        <div class="form-container">
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

                            {if $_c['photo_register'] == 'yes'}
                                <div class="form-group">
                                    <label>{Lang::T('Photo')}</label>
                                    <input type="file" required class="form-control" id="photo" name="photo" accept="image/*" style="padding: 3px;">
                                </div>
                            {/if}

                            <div class="form-group">
                                <label>{Lang::T('Full Name')}</label>
                                <input type="text" {if $_c['man_fields_fname'] neq 'no'}required{/if} class="form-control" id="fullname" value="{$fullname}" name="fullname">
                            </div>

                            <div class="form-group">
                                <label>{Lang::T('Email')}</label>
                                <input type="text" {if $_c['man_fields_email'] neq 'no'}required{/if} class="form-control" id="email" placeholder="email@example.com" value="{$email}" name="email">
                            </div>

                            <div class="form-group">
                                <label>{Lang::T('Home Address')}</label>
                                <input type="text" {if $_c['man_fields_address'] neq 'no'}required{/if} name="address" id="address" value="{$address}" class="form-control">
                            </div>

                            {$customFields}
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">2. {Lang::T('Password')}</div>
                    <div class="panel-body">
                        <div class="form-container">
                            <div class="form-group">
                                <label>{Lang::T('Password')}</label>
                                <input type="password" required class="form-control" id="password" name="password">
                            </div>
                            <div class="form-group">
                                <label>{Lang::T('Confirm Password')}</label>
                                <input type="password" required class="form-control" id="cpassword" name="cpassword">
                            </div>

                            <div class="form-group" style="margin-top: 20px;">
                                <button class="btn btn-success btn-block" type="submit">{Lang::T('Register')}</button>
                                <a href="{Text::url('login')}" class="btn btn-warning btn-block">{Lang::T('Cancel')}</a>
                            </div>

                            <div style="text-align: center; margin-top: 10px;">
                                <a href="javascript:showPrivacy()">Privacy</a> &bull; <a href="javascript:showTaC()">T&C</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

{include file="customer/footer-public.tpl"}
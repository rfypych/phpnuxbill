{include file="customer/header.tpl"}

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-danger">
            <div class="panel-heading">{Lang::T('Change Phone Number')}</div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label">{Lang::T('Current Number')}</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                <input type="text" class="form-control" value="{$_user['phonenumber']}" readonly>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <form method="post" role="form" action="{Text::url('accounts/phone-update-otp')}">
                        <input type="hidden" name="csrf_token" value="{$csrf_token}">
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('New Number')}</label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                    <input type="number" class="form-control" name="phone" id="phone" value="{$new_phone}" required placeholder="081xxxxxxx">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-info">{Lang::T('Request OTP')}</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form method="post" role="form" action="{Text::url('accounts/phone-update-post')}">
                        <input type="hidden" name="csrf_token" value="{$csrf_token}">
                        <div class="form-group">
                            <label class="col-md-3 control-label">{Lang::T('OTP Code')}</label>
                            <div class="col-md-9">
                                <input type="number" class="form-control" id="otp" name="otp" placeholder="{Lang::T('Enter OTP code')}" required>
                            </div>
                        </div>

                        <input type="hidden" name="phone" id="hidden_phone">

                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-success" type="submit" onclick="return validateForm()">{Lang::T('Update Number')}</button>
                                <a href="{Text::url('home')}" class="btn btn-default">{Lang::T('Cancel')}</a>
                            </div>
                        </div>
                    </form>

                    <script>
                        function validateForm() {
                            var phoneNumber = document.getElementById("phone").value;
                            var otp = document.getElementById("otp").value;
                            if (phoneNumber.trim() === "") {
                                alert("Phone number is required.");
                                return false;
                            }
                            if (otp.trim() === "") {
                                alert("OTP code is required.");
                                return false;
                            }
                            document.getElementById("hidden_phone").value = phoneNumber;
                            return true;
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
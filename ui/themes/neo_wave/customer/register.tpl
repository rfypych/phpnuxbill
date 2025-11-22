<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{Lang::T('Register')} - {$_c['CompanyName']}</title>
    <link rel="shortcut icon" href="{$app_url}/ui/ui/images/logo.png" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/style.css?v=1.0">
</head>
<body>

<div class="split-screen">
    <!-- Left Side: Artistic/Branding -->
    <div class="split-art" style="background-image: url('https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=2070&auto=format&fit=crop');">
        <div class="split-content">
            <h1 style="font-size: 3rem; margin-bottom: 1rem;">{Lang::T('Join Us')}</h1>
            <p style="font-size: 1.2rem; opacity: 0.9;">{Lang::T('Create your account and get started in minutes.')}</p>
        </div>
    </div>

    <!-- Right Side: Register Form -->
    <div class="split-form">
        <div style="margin-bottom: 2rem;">
            <h2>{Lang::T('Register')}</h2>
            <p class="text-muted">{Lang::T('Please fill in the following fields to register')}</p>
        </div>

        <div class="panel-body">
            <form action="{Text::url('register/post')}" method="post">
                <input type="hidden" name="csrf_token" value="{$csrf_token}">

                <div class="form-group">
                    <label>{Lang::T('Username')}</label>
                    <input type="text" class="form-control" name="username" placeholder="{Lang::T('Username')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Full Name')}</label>
                    <input type="text" class="form-control" name="fullname" placeholder="{Lang::T('Full Name')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Email')}</label>
                    <input type="email" class="form-control" name="email" placeholder="{Lang::T('Email')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Phone Number')}</label>
                    <input type="text" class="form-control" name="phone" placeholder="{$_c['country_code_phone']} {Lang::T('Phone Number')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Address')}</label>
                    <input type="text" class="form-control" name="address" placeholder="{Lang::T('Address')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Password')}</label>
                    <input type="password" class="form-control" name="password" placeholder="{Lang::T('Password')}" required>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Confirm Password')}</label>
                    <input type="password" class="form-control" name="cpassword" placeholder="{Lang::T('Confirm Password')}" required>
                </div>

                <!-- Custom Fields Hook -->
                {if isset($custom_fields)}
                    {$custom_fields}
                {/if}

                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-block">
                        {Lang::T('Register')} <i data-feather="user-plus" style="margin-left: 8px; width: 16px;"></i>
                    </button>
                </div>

                <div style="margin-top: 1.5rem; text-align: center;">
                    <p class="text-muted">
                        {Lang::T('Already have an account?')}
                        <a href="{Text::url('login')}" style="font-weight: 600;">{Lang::T('Login')}</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="{$app_url}/ui/ui/scripts/jquery.min.js"></script>
<script>
    feather.replace();
</script>

</body>
</html>
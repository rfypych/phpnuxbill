<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{Lang::T('Login')} - {$_c['CompanyName']}</title>
    <link rel="shortcut icon" href="{$app_url}/ui/ui/images/logo.png" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/style.css?v=1.0">
</head>
<body>

<div class="split-screen">
    <!-- Left Side: Artistic/Branding -->
    <div class="split-art" style="background-image: url('https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop');">
        <div class="split-content">
            <h1 style="font-size: 3rem; margin-bottom: 1rem;">{$_c['CompanyName']}</h1>
            <p style="font-size: 1.2rem; opacity: 0.9;">{Lang::T('Welcome to the future of connectivity.')}</p>
        </div>
    </div>

    <!-- Right Side: Login Form -->
    <div class="split-form">
        <div style="margin-bottom: 2rem;">
            <h2>{Lang::T('Welcome Back')}</h2>
            <p class="text-muted">{Lang::T('Please sign in to your account')}</p>
        </div>

        <div class="panel-body"> <!-- Class kept for potential JS hooks, though styled via split-form -->
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
                    <div style="position: relative;">
                        <input type="text" class="form-control" name="username"
                            placeholder="{if $_c['country_code_phone']!= '' || $_c['registration_username'] == 'phone'}{$_c['country_code_phone']} {Lang::T('Phone Number')}{elseif $_c['registration_username'] == 'email'}{Lang::T('Email')}{else}{Lang::T('Usernames')}{/if}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>{Lang::T('Password')}</label>
                    <div style="position: relative;">
                        <input type="password" class="form-control" name="password" placeholder="{Lang::T('Password')}" required>
                    </div>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">
                        {Lang::T('Login')} <i data-feather="arrow-right" style="margin-left: 8px; width: 16px;"></i>
                    </button>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1.5rem;">
                    {if $_c['disable_registration'] != 'noreg'}
                        <a href="{Text::url('register')}" class="text-muted" style="font-size: 0.9rem;">
                            {Lang::T('Create an account')}
                        </a>
                    {/if}
                    <a href="{Text::url('forgot')}" class="text-muted" style="font-size: 0.9rem;">
                        {Lang::T('Forgot Password')}
                    </a>
                </div>

                <div style="margin-top: 2rem; text-align: center; font-size: 0.8rem; color: var(--text-muted);">
                    <a href="javascript:showPrivacy()">Privacy</a> &bull; <a href="javascript:showTaC()">T &amp; C</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Structure -->
<div id="customModalOverlay" class="custom-modal-overlay">
    <div class="custom-modal">
        <button class="close-modal" onclick="closeModal()">&times;</button>
        <h3 id="customModalTitle"></h3>
        <div id="customModalContent" style="margin-top: 1rem;"></div>
    </div>
</div>

<script src="{$app_url}/ui/ui/scripts/jquery.min.js"></script>
<script>
    feather.replace();

    // Modal Logic (Duplicated here because login.tpl usually doesn't include footer.tpl in some themes, or I made a standalone page)
    // Based on original login.tpl, it includes header-public.tpl and footer-public.tpl.
    // But since I am making a radical change with split screen, I am building a standalone structure for Login.

    const modalOverlay = document.getElementById('customModalOverlay');
    const modalTitle = document.getElementById('customModalTitle');
    const modalContent = document.getElementById('customModalContent');

    window.openModal = function(title, content) {
        modalTitle.innerText = title;
        modalContent.innerHTML = content;
        modalOverlay.classList.add('active');
    }

    window.closeModal = function() {
        modalOverlay.classList.remove('active');
    }

    window.showPrivacy = function() {
        openModal('Privacy Policy', '<center>Loading...</center>');
        $.get('pages/Privacy_Policy.html?' + (new Date()), function (data) {
            modalContent.innerHTML = data;
        });
    }

    window.showTaC = function() {
        openModal('Terms and Conditions', '<center>Loading...</center>');
        $.get('pages/Terms_and_Conditions.html?' + (new Date()), function (data) {
            modalContent.innerHTML = data;
        });
    }
</script>

</body>
</html>
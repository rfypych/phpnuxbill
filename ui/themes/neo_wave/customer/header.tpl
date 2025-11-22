<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$_title} - {$_c['CompanyName']}</title>

    <script>
        var appUrl = '{$app_url}';
    </script>

    <link rel="shortcut icon" href="{$app_url}/ui/ui/images/logo.png" type="image/x-icon" />

    <!-- Neo Wave Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/style.css?v=1.0">
    <link rel="stylesheet" href="{$app_url}/ui/ui/styles/sweetalert2.min.css" />
    <script src="{$app_url}/ui/ui/scripts/sweetalert2.all.min.js"></script>

    <!-- Custom Header Hook -->
    {if isset($xheader)}
        {$xheader}
    {/if}

    <script>
        // Dark Mode Init
        const savedMode = localStorage.getItem('mode');
        if (savedMode === 'dark') {
            document.body.classList.add('dark-mode');
        }
    </script>
</head>

<body class="{if isset($savedMode) && $savedMode == 'dark'}dark-mode{/if}">
    <div class="wrapper">
        <!-- Floating Sidebar -->
        <aside class="main-sidebar">
            <div class="brand-link">
                <span>{$_c['CompanyName']}</span>
            </div>
            <ul class="sidebar-menu">
                <li {if $_system_menu eq 'home'}class="active" {/if}>
                    <a href="{Text::url('home')}">
                        <i data-feather="grid"></i>
                        <span>{Lang::T('Dashboard')}</span>
                    </a>
                </li>

                {$_MENU_AFTER_DASHBOARD}

                <li {if $_system_menu eq 'inbox'}class="active" {/if}>
                    <a href="{Text::url('mail')}">
                        <i data-feather="mail"></i>
                        <span>{Lang::T('Inbox')}</span>
                    </a>
                </li>

                {$_MENU_AFTER_INBOX}

                {if $_c['disable_voucher'] != 'yes'}
                    <li {if $_system_menu eq 'voucher'}class="active" {/if}>
                        <a href="{Text::url('voucher/activation')}">
                            <i data-feather="tag"></i>
                            <span>Voucher</span>
                        </a>
                    </li>
                {/if}

                {if $_c['payment_gateway'] != 'none' or $_c['payment_gateway'] == '' }
                    {if $_c['enable_balance'] == 'yes'}
                        <li {if $_system_menu eq 'balance'}class="active" {/if}>
                            <a href="{Text::url('order/balance')}">
                                <i data-feather="credit-card"></i>
                                <span>{Lang::T('Buy Balance')}</span>
                            </a>
                        </li>
                    {/if}
                    <li {if $_system_menu eq 'package'}class="active" {/if}>
                        <a href="{Text::url('order/package')}">
                            <i data-feather="shopping-bag"></i>
                            <span>{Lang::T('Buy Package')}</span>
                        </a>
                    </li>
                    <li {if $_system_menu eq 'history'}class="active" {/if}>
                        <a href="{Text::url('order/history')}">
                            <i data-feather="file-text"></i>
                            <span>{Lang::T('Payment History')}</span>
                        </a>
                    </li>
                {/if}

                {$_MENU_AFTER_ORDER}

                <li {if $_system_menu eq 'list-activated'}class="active" {/if}>
                    <a href="{Text::url('voucher/list-activated')}">
                        <i data-feather="list"></i>
                        <span>{Lang::T('Activation History')}</span>
                    </a>
                </li>

                {$_MENU_AFTER_HISTORY}
            </ul>
        </aside>

        <!-- Main Content Wrapper -->
        <div class="content-wrapper">
            <!-- Glassmorphism Navbar -->
            <header class="main-header">
                <button class="sidebar-toggle" id="sidebarToggle">
                    <i data-feather="menu"></i>
                </button>

                <div style="flex:1"></div>

                <ul class="navbar-nav">
                    <!-- Dark Mode Toggle -->
                    <li class="nav-item">
                        <a href="#" class="nav-link" id="darkModeToggle">
                            <i data-feather="moon" id="darkModeIcon"></i>
                        </a>
                    </li>

                    <!-- User Menu -->
                    <li class="nav-item dropdown">
                        <a href="{Text::url('accounts/profile')}" class="nav-link">
                            {if $_c['enable_balance'] == 'yes'}
                                <span>{Lang::moneyFormat($_user['balance'])}</span>
                            {else}
                                <span>{$_user['fullname']}</span>
                            {/if}
                            <img src="{$app_url}/{$UPLOAD_PATH}{$_user['photo']}.thumb.jpg"
                                 onerror="this.src='{$app_url}/{$UPLOAD_PATH}/user.default.jpg'" class="user-image"
                                 alt="User Image">
                        </a>
                    </li>

                    <li class="nav-item">
                         <a href="{Text::url('logout')}" class="nav-link" title="{Lang::T('Logout')}">
                            <i data-feather="power"></i>
                        </a>
                    </li>
                </ul>
            </header>

            <section class="content">
                <div class="page-header mb-4">
                    <h1>{$_title}</h1>
                </div>

                {if isset($notify)}
                    <script>
                        Swal.fire({
                            icon: '{if $notify_t == "s"}success{else}warning{/if}',
                            title: '{$notify}',
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 5000,
                            timerProgressBar: true,
                            toast: true
                        });
                    </script>
                {/if}

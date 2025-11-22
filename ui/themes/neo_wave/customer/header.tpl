<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$_title} - {$_c['CompanyName']}</title>
    <link rel="shortcut icon" href="{$app_url}/ui/themes/neo_wave/images/logo.png" type="image/x-icon" />

    <script>
        var appUrl = '{$app_url}';
    </script>

    <!-- Dependencies -->
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/sweetalert2.min.css" />

    <!-- Neo Wave Theme CSS -->
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/neo-wave.css?v=1.0">

    <script src="{$app_url}/ui/themes/neo_wave/scripts/sweetalert2.all.min.js"></script>

    {if isset($xheader)}
        {$xheader}
    {/if}
</head>

<body>
    <script>
        // Dark Mode Check - Prevent FOUC
        if (localStorage.getItem('mode') === 'dark') {
            document.body.classList.add('dark-mode');
        }
    </script>

    <div class="wrapper">
        <!-- Header Navbar -->
        <header class="main-header">
            <a href="{Text::url('home')}" class="logo">
                <span>{$_c['CompanyName']}</span>
            </a>

            <a href="#" id="sidebarToggle" class="sidebar-toggle-btn">
                <i class="fa fa-bars"></i>
            </a>

            <div class="navbar-custom-menu">
                <ul>
                    <li>
                        <a href="#" id="toggleIcon">
                            <i class="fa fa-moon-o"></i>
                        </a>
                    </li>

                    <!-- Notifications -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning" api-get-text="{Text::url('autoload_user/inbox_unread')}"></span>
                        </a>
                        <ul class="dropdown-menu" style="position: absolute; right: 0; background: var(--bg-card); border: 1px solid var(--border-color); list-style: none; padding: 10px; display: none;">
                            <li class="header">You have new notifications</li>
                            <li>
                                <ul class="menu" api-get-text="{Text::url('autoload_user/inbox')}"></ul>
                            </li>
                            <li class="footer"><a href="{Text::url('mail')}">{Lang::T('View all')}</a></li>
                        </ul>
                    </li>

                    <!-- User Account -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="display: flex; align-items: center; gap: 10px;">
                            <img src="{$app_url}/{$UPLOAD_PATH}{$_user['photo']}.thumb.jpg"
                                 onerror="this.src='{$app_url}/{$UPLOAD_PATH}/user.default.jpg'"
                                 class="user-image" alt="User Image">
                            <span class="hidden-xs">
                                {if $_c['enable_balance'] == 'yes'}
                                    {Lang::moneyFormat($_user['balance'])}
                                {else}
                                    {$_user['fullname']}
                                {/if}
                            </span>
                        </a>
                        <ul class="dropdown-menu" style="position: absolute; right: 0; background: var(--bg-card); border: 1px solid var(--border-color); list-style: none; padding: 10px; min-width: 200px; display: none;">
                            <li class="user-header" style="text-align: center; padding-bottom: 10px; border-bottom: 1px solid var(--border-color);">
                                <p>
                                    {$_user['fullname']}
                                    <small style="display: block; color: var(--text-muted); font-size: 0.8rem;">{$_user['email']}</small>
                                </p>
                            </li>
                            <li class="user-body" style="padding: 10px 0;">
                                <div style="display: flex; justify-content: space-between;">
                                    <a href="{Text::url('accounts/change-password')}" class="btn btn-default btn-xs">{Lang::T('Password')}</a>
                                    <a href="{Text::url('accounts/profile')}" class="btn btn-default btn-xs">{Lang::T('Profile')}</a>
                                </div>
                            </li>
                            <li class="user-footer" style="text-align: center; padding-top: 5px;">
                                <a href="{Text::url('logout')}" class="btn btn-danger btn-block btn-sm">{Lang::T('Logout')}</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>

        <!-- Sidebar -->
        <aside class="main-sidebar">
            <section class="sidebar">
                <ul class="sidebar-menu">
                    <li class="header" style="padding: 10px 20px; color: rgba(255,255,255,0.5); font-size: 0.8rem; text-transform: uppercase;">{Lang::T('Menu')}</li>

                    <li {if $_system_menu eq 'home'}class="active"{/if}>
                        <a href="{Text::url('home')}">
                            <i class="ion ion-monitor"></i> <span>{Lang::T('Dashboard')}</span>
                        </a>
                    </li>

                    {$_MENU_AFTER_DASHBOARD}

                    <li {if $_system_menu eq 'inbox'}class="active"{/if}>
                        <a href="{Text::url('mail')}">
                            <i class="fa fa-envelope"></i> <span>{Lang::T('Inbox')}</span>
                        </a>
                    </li>

                    {$_MENU_AFTER_INBOX}

                    {if $_c['disable_voucher'] != 'yes'}
                        <li {if $_system_menu eq 'voucher'}class="active"{/if}>
                            <a href="{Text::url('voucher/activation')}">
                                <i class="fa fa-ticket"></i> <span>{Lang::T('Voucher')}</span>
                            </a>
                        </li>
                    {/if}

                    {if $_c['payment_gateway'] != 'none' or $_c['payment_gateway'] == '' }
                        {if $_c['enable_balance'] == 'yes'}
                            <li {if $_system_menu eq 'balance'}class="active"{/if}>
                                <a href="{Text::url('order/balance')}">
                                    <i class="ion ion-cash"></i> <span>{Lang::T('Buy Balance')}</span>
                                </a>
                            </li>
                        {/if}
                        <li {if $_system_menu eq 'package'}class="active"{/if}>
                            <a href="{Text::url('order/package')}">
                                <i class="ion ion-ios-cart"></i> <span>{Lang::T('Buy Package')}</span>
                            </a>
                        </li>
                        <li {if $_system_menu eq 'history'}class="active"{/if}>
                            <a href="{Text::url('order/history')}">
                                <i class="fa fa-history"></i> <span>{Lang::T('History')}</span>
                            </a>
                        </li>
                    {/if}

                    {$_MENU_AFTER_ORDER}

                    <li {if $_system_menu eq 'list-activated'}class="active"{/if}>
                        <a href="{Text::url('voucher/list-activated')}">
                            <i class="fa fa-list-alt"></i> <span>{Lang::T('Activation History')}</span>
                        </a>
                    </li>

                    {$_MENU_AFTER_HISTORY}
                </ul>
            </section>
        </aside>

        <div class="content-wrapper">
            <section class="content-header" style="margin-bottom: 20px;">
                <h1 style="font-size: 1.5rem; font-weight: 700; margin: 0;">{$_title}</h1>
            </section>

            <section class="content">
                {if isset($notify)}
                    <script>
                        Swal.fire({
                            icon: '{if $notify_t == "s"}success{else}warning{/if}',
                            title: '{$notify}',
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 5000,
                            timerProgressBar: true
                        });
                    </script>
                {/if}

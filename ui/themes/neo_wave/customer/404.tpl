{include file="customer/header-public.tpl"}

<div class="container" style="margin-top: 100px; text-align: center;">
    <h1 style="font-size: 8rem; font-weight: bold; color: var(--primary-color);">404</h1>
    <h2 style="color: var(--text-main);">{Lang::T("Oops! Page not found.")}</h2>
    <p style="color: var(--text-muted); margin-bottom: 30px;">{Lang::T("The page you are looking for might have been removed or is temporarily unavailable.")}</p>
    <a href="{Text::url('home')}" class="btn btn-primary btn-lg">
        <i class="ion ion-home"></i> {Lang::T("Back to Dashboard")}
    </a>
</div>

{include file="customer/footer-public.tpl"}
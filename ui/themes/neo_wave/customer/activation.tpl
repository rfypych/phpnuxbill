{include file="customer/header.tpl"}
<!-- user-activation -->

<div class="row">
    <div class="col-md-8">
        <div class="box box-primary box-solid">
            <div class="box-header">
                <h3 class="box-title">{Lang::T('Order Voucher')}</h3>
            </div>
            <div class="box-body">
                <!-- Preserving original include logic, assuming page exists. If not, styles handle fallback -->
                {include file="$PAGES_PATH/Order_Voucher.html"}
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="box box-primary box-solid">
            <div class="box-header">{Lang::T('Voucher Activation')}</div>
            <div class="box-body">
                <form method="post" role="form" action="{Text::url('voucher/activation-post')}">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" id="code" name="code" value="{$code|escape:'html'}"
                                placeholder="{Lang::T('Enter voucher code here')}">
                            <span class="input-group-btn">
                                <a class="btn btn-default"
                                    href="{$app_url|escape:'html'}/scan/?back={urlencode(Text::url('voucher/activation&code='))}"
                                    style="border-radius: 0 var(--radius-md) var(--radius-md) 0; border-left: 0; height: 100%; display: flex; align-items: center; padding: 0.75rem 1rem;">
                                    <i data-feather="camera"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success btn-block" type="submit">{Lang::T('Recharge')}</button>
                        <div class="text-center mt-2" style="margin-top: 10px;">
                            <a href="{Text::url('home')}" class="text-muted">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
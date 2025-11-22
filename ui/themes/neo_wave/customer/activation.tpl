{include file="customer/header.tpl"}

<div class="row">
    <div class="col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">{Lang::T('Order Voucher')}</div>
            <div class="panel-body">
                {include file="$PAGES_PATH/Order_Voucher.html"}
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="panel panel-success">
            <div class="panel-heading">{Lang::T('Voucher Activation')}</div>
            <div class="panel-body">
                <form method="post" role="form" action="{Text::url('voucher/activation-post')}">
                    <div class="form-group">
                        <label>{Lang::T('Voucher Code')}</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="code" name="code" value="{$code|escape:'html'}" placeholder="XXXX-XXXX-XXXX">
                            <span class="input-group-btn">
                                <a class="btn btn-default" href="{$app_url|escape:'html'}/scan/?back={urlencode(Text::url('voucher/activation&code='))}">
                                    <i class="fa fa-qrcode"></i>
                                </a>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <button class="btn btn-success btn-block" type="submit">{Lang::T('Activate')}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
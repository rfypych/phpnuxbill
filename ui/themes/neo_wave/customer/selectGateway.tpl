{include file="customer/header.tpl"}

<div class="row">
    {if file_exists("$PAGES_PATH/Payment_Info.html")}
        <div class="col-md-6">
            <div class="panel panel-warning">
                <div class="panel-heading">{Lang::T('Payment Info')}</div>
                <div class="panel-body">{include file="$PAGES_PATH/Payment_Info.html"}</div>
            </div>
        </div>
    {/if}

    <div class="{if file_exists("$PAGES_PATH/Payment_Info.html")}col-md-6{else}col-md-6 col-md-offset-3{/if}">
        <div class="panel panel-success">
            <div class="panel-heading">{Lang::T('Make Payment')}</div>

            <div class="panel-body">
                <h4 class="text-center"><strong>{Lang::T('Package Details')}</strong></h4>

                <div class="list-group">
                    {if !$custom}
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <b>{Lang::T('Package Name')}</b>
                            <span class="pull-right">{$plan['name_plan']}</span>
                        </div>

                        {if $plan['is_radius'] or $plan['routers']}
                            <div class="list-group-item">
                                <b>{Lang::T('Location')}</b>
                                <span class="pull-right">{if $plan['is_radius']}Radius{else}{$plan['routers']}{/if}</span>
                            </div>
                        {/if}

                        <div class="list-group-item">
                            <b>{Lang::T('Type')}</b>
                            <span class="pull-right">
                                {if $plan['prepaid'] eq 'yes'}{Lang::T('Prepaid')}{else}{Lang::T('Postpaid')}{/if}
                                {$plan['type']}
                            </span>
                        </div>

                        <div class="list-group-item">
                            <b>{Lang::T('Price')}</b>
                            <span class="pull-right">
                                {if !empty($plan['price_old'])}
                                    <small class="text-danger" style="text-decoration: line-through;">{Lang::moneyFormat($plan['price_old'])}</small>
                                {/if}
                                {Lang::moneyFormat($plan['price'])}
                            </span>
                        </div>

                        {if $plan['validity']}
                            <div class="list-group-item">
                                <b>{Lang::T('Validity')}</b>
                                <span class="pull-right">{$plan['validity']} {$plan['validity_unit']}</span>
                            </div>
                        {/if}
                    {else}
                        <div class="list-group-item">
                            <b>{Lang::T('Package Name')}</b>
                            <span class="pull-right">{Lang::T('Custom Balance')}</span>
                        </div>
                        <div class="list-group-item">
                            <b>{Lang::T('Amount')}</b>
                            <span class="pull-right">{Lang::moneyFormat($amount)}</span>
                        </div>
                    {/if}
                </div>

                {if $discount == '' && $plan['type'] neq 'Balance' && $custom == '' && $_c['enable_coupons'] == 'yes'}
                    <form action="{Text::url('order/gateway/')}{$route2}/{$route3}" method="post" class="mb-3">
                        <div class="input-group">
                            <input type="text" class="form-control" name="coupon" id="coupon" placeholder="{Lang::T('Enter coupon code')}" required>
                            <span class="input-group-btn">
                                <button type="submit" name="add_coupon" class="btn btn-info">{Lang::T('Apply')}</button>
                            </span>
                        </div>
                    </form>
                {/if}

                <h4 class="text-center" style="margin-top: 20px;"><strong>{Lang::T('Summary')}</strong></h4>
                <div class="list-group">
                    {if $add_cost != 0}
                        {foreach $bills as $k => $v}
                            <div class="list-group-item">
                                <b>{$k}</b>
                                <span class="pull-right">{Lang::moneyFormat($v)}</span>
                            </div>
                        {/foreach}
                        <div class="list-group-item">
                            <b>{Lang::T('Additional Cost')}</b>
                            <span class="pull-right">{Lang::moneyFormat($add_cost)}</span>
                        </div>
                    {/if}

                    {if $discount}
                        <div class="list-group-item list-group-item-success">
                            <b>{Lang::T('Discount')}</b>
                            <span class="pull-right">-{Lang::moneyFormat($discount)}</span>
                        </div>
                    {/if}

                    <div class="list-group-item active">
                        <b>{Lang::T('Total')}</b>
                        <span class="pull-right" style="font-size: 1.2em; font-weight: bold;">
                            {if $amount neq '' && $custom == '1'}
                                {Lang::moneyFormat($amount)}
                            {elseif $plan['type'] eq 'Balance'}
                                {Lang::moneyFormat($plan['price'] + $add_cost)}
                            {else}
                                {Lang::moneyFormat($plan['price'] + $add_cost + $tax)}
                            {/if}
                        </span>
                    </div>
                </div>

                <form method="post" action="{Text::url('order/buy/')}{$route2}/{$route3}">
                    <input type="hidden" name="coupon" value="{$discount}">
                    {if $custom == '1' && $amount neq ''}
                        <input type="hidden" name="custom" value="1">
                        <input type="hidden" name="amount" value="{$amount}">
                    {/if}

                    <div class="form-group">
                        <label>{Lang::T('Select Payment Gateway')}</label>
                        <select name="gateway" id="gateway" class="form-control">
                            {if $_c['enable_balance'] neq 'no' && $plan['type'] neq 'Balance' && $custom == '' && $_user['balance'] >= $plan['price'] + $add_cost + $tax}
                                <option value="balance">{Lang::T('Balance')} ({Lang::moneyFormat($_user['balance'])})</option>
                            {/if}
                            {foreach $pgs as $pg}
                                <option value="{$pg}">{ucwords($pg)}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="text-center mt-3">
                        <button type="submit" name="pay" class="btn btn-primary btn-lg btn-block" onclick="return ask(this, '{Lang::T("Are You Sure?")}')">
                            <i class="ion ion-card"></i> {Lang::T('Pay Now')}
                        </button>
                        <br>
                        <a href="{Text::url('home')}" class="btn btn-default">{Lang::T('Cancel')}</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
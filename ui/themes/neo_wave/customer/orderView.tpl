{include file="customer/header.tpl"}

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel {if $trx['status']==1}panel-warning{elseif $trx['status']==2}panel-success{elseif $trx['status']==3}panel-danger{elseif $trx['status']==4}panel-danger{else}panel-primary{/if}">
            <div class="panel-heading text-center">
                {Lang::T('Transaction')} #{$trx['id']}
            </div>

            <div class="panel-body">
                {if !in_array($trx['routers'],['balance','radius'])}
                    <div class="well well-sm">
                        <strong>{$router['name']}</strong><br>
                        {$router['description']}
                    </div>
                {/if}

                <table class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td>{Lang::T('Status')}</td>
                            <td>
                                {if $trx['status']==1}<span class="label label-warning">{Lang::T('UNPAID')}</span>
                                {elseif $trx['status']==2}<span class="label label-success">{Lang::T('PAID')}</span>
                                {elseif $trx['status']==3}<span class="label label-danger">{Lang::T('FAILED')}</span>
                                {elseif $trx['status']==4}<span class="label label-danger">{Lang::T('CANCELED')}</span>
                                {else}<span class="label label-default">{Lang::T('UNKNOWN')}</span>{/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{Lang::T('Package Name')}</td>
                            <td>{$plan['name_plan']}</td>
                        </tr>
                        <tr>
                            <td>{Lang::T('Type')}</td>
                            <td>{$plan['type']}</td>
                        </tr>
                         <tr>
                            <td>{Lang::T('Price')}</td>
                            <td style="font-size: 1.2em; font-weight: bold;">{Lang::moneyFormat($trx['price'])}</td>
                        </tr>
                        {if $trx['status']==2}
                            <tr>
                                <td>{Lang::T('Paid Date')}</td>
                                <td>{date($_c['date_format'], strtotime($trx['paid_date']))} {date('H:i', strtotime($trx['paid_date']))}</td>
                            </tr>
                        {/if}
                        <tr>
                            <td>{Lang::T('Expired Date')}</td>
                            <td>{date($_c['date_format'], strtotime($trx['expired_date']))} {date('H:i', strtotime($trx['expired_date']))}</td>
                        </tr>

                        {if $trx['pg_url_payment']!='balance'}
                            {if $plan['type']!='Balance'}
                                <tr>
                                    <td>{Lang::T('Validity')}</td>
                                    <td>{$plan['validity']} {$plan['validity_unit']}</td>
                                </tr>
                            {/if}
                        {/if}
                    </tbody>
                </table>
            </div>

            {if $trx['status']==1}
                <div class="panel-footer text-center">
                    <a href="{$trx['pg_url_payment']}" {if $trx['gateway']=='midtrans'}target="_blank"{/if} class="btn btn-primary btn-lg">
                        {Lang::T('Pay Now')}
                    </a>
                    <div style="margin-top: 10px;">
                         <a href="{Text::url('order/view/', $trx['id'], '/check')}" class="btn btn-info btn-sm">{Lang::T('Check Payment')}</a>
                         <a href="{Text::url('order/view/', $trx['id'], '/cancel')}" class="btn btn-danger btn-sm" onclick="return ask(this, '{Lang::T('Cancel it?')}')">{Lang::T('Cancel')}</a>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
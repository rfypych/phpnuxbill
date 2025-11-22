{include file="customer/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">{Lang::T('Order History')}</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table id="datatable" class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>{Lang::T('Package Name')}</th>
                                <th>{Lang::T('Gateway')}</th>
                                <th>{Lang::T('Type')}</th>
                                <th>{Lang::T('Price')}</th>
                                <th>{Lang::T('Date')}</th>
                                <th>{Lang::T('Expires')}</th>
                                <th>{Lang::T('Status')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $d as $ds}
                                <tr>
                                    <td><a href="{Text::url('order/view/')}{$ds['id']}">{$ds['plan_name']}</a></td>
                                    <td>{$ds['gateway']}</td>
                                    <td>{$ds['payment_channel']}</td>
                                    <td>{Lang::moneyFormat($ds['price'])}</td>
                                    <td>{date("{$_c['date_format']} H:i", strtotime($ds['created_date']))}</td>
                                    <td>{date("{$_c['date_format']} H:i", strtotime($ds['expired_date']))}</td>
                                    <td>
                                        {if $ds['status']==1}<span class="label label-warning">{Lang::T('UNPAID')}</span>
                                        {elseif $ds['status']==2}<span class="label label-success">{Lang::T('PAID')}</span>
                                        {elseif $ds['status']==3}<span class="label label-danger">{Lang::T('FAILED')}</span>
                                        {elseif $ds['status']==4}<span class="label label-danger">{Lang::T('CANCELED')}</span>
                                        {else}<span class="label label-default">{Lang::T('UNKNOWN')}</span>{/if}
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                {include file="pagination.tpl"}
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
{include file="customer/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="box box-solid box-default">
            <div class="box-header">
                <h3 class="box-title">{Lang::T('Order Internet Package')}</h3>
            </div>
        </div>

        <!-- Plan Listing Logic -->
        {if $_c['radius_enable']}
            {if $_user['service_type'] == 'PPPoE'}
                {if Lang::arrayCount($radius_pppoe)>0}
                    <h4 class="page-header">{if $_c['radius_plan']==''}Radius Plan{else}{$_c['radius_plan']}{/if} / {if $_c['pppoe_plan']==''}PPPOE Plan{else}{$_c['pppoe_plan']}{/if}</h4>
                    <div class="row">
                        {foreach $radius_pppoe as $plan}
                            <div class="col-md-4 col-sm-6">
                                <div class="panel panel-primary plan-card">
                                    <div class="panel-heading text-center">
                                        <h3 class="panel-title">{$plan['name_plan']}</h3>
                                    </div>
                                    <div class="panel-body text-center">
                                        <h2 class="price-tag">
                                            {Lang::moneyFormat($plan['price'])}
                                            {if !empty($plan['price_old'])}
                                                <small class="text-danger" style="text-decoration: line-through;">{Lang::moneyFormat($plan['price_old'])}</small>
                                            {/if}
                                        </h2>
                                        <hr>
                                        <ul class="list-unstyled">
                                            <li><strong>{Lang::T('Type')}:</strong> {$plan['type']}</li>
                                            {if $_c['show_bandwidth_plan'] == 'yes'}
                                                <li><strong>{Lang::T('Bandwidth')}:</strong> <span api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}"></span></li>
                                            {/if}
                                            <li><strong>{Lang::T('Validity')}:</strong> {$plan['validity']} {$plan['validity_unit']}</li>
                                        </ul>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="{Text::url('order/gateway/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                            onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                            class="btn btn-success btn-block">{Lang::T('Buy Now')}</a>

                                        {if $_c['enable_balance'] == 'yes' && $_c['allow_balance_transfer'] == 'yes' && $_user['balance']>=$plan['price']}
                                            <a href="{Text::url('order/send/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                                onclick="return ask(this, '{Lang::T('Buy this for friend account?')}')"
                                                class="btn btn-info btn-block" style="margin-top: 5px;">{Lang::T('Buy for friend')}</a>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {elseif $_user['service_type'] == 'Hotspot'}
                {if Lang::arrayCount($radius_hotspot)>0}
                    <h4 class="page-header">{if $_c['radius_plan']==''}Radius Plan{else}{$_c['radius_plan']}{/if} / {if $_c['hotspot_plan']==''}Hotspot Plan{else}{$_c['hotspot_plan']}{/if}</h4>
                    <div class="row">
                        {foreach $radius_hotspot as $plan}
                            <div class="col-md-4 col-sm-6">
                                <div class="panel panel-primary plan-card">
                                    <div class="panel-heading text-center">
                                        <h3 class="panel-title">{$plan['name_plan']}</h3>
                                    </div>
                                    <div class="panel-body text-center">
                                        <h2 class="price-tag">
                                            {Lang::moneyFormat($plan['price'])}
                                            {if !empty($plan['price_old'])}
                                                <small class="text-danger" style="text-decoration: line-through;">{Lang::moneyFormat($plan['price_old'])}</small>
                                            {/if}
                                        </h2>
                                        <hr>
                                        <ul class="list-unstyled">
                                            <li><strong>{Lang::T('Type')}:</strong> {$plan['type']}</li>
                                            {if $_c['show_bandwidth_plan'] == 'yes'}
                                                <li><strong>{Lang::T('Bandwidth')}:</strong> <span api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}"></span></li>
                                            {/if}
                                            <li><strong>{Lang::T('Validity')}:</strong> {$plan['validity']} {$plan['validity_unit']}</li>
                                        </ul>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="{Text::url('order/gateway/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                            onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                            class="btn btn-success btn-block">{Lang::T('Buy Now')}</a>

                                        {if $_c['enable_balance'] == 'yes' && $_c['allow_balance_transfer'] == 'yes' && $_user['balance']>=$plan['price']}
                                            <a href="{Text::url('order/send/radius/', $plan['id'], '&stoken=', App::getToken())}"
                                                onclick="return ask(this, '{Lang::T('Buy this for friend account?')}')"
                                                class="btn btn-info btn-block" style="margin-top: 5px;">{Lang::T('Buy for friend')}</a>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {/if}
        {/if}

        <!-- Regular Routers Loop -->
        {foreach $routers as $router}
            {if Validator::isRouterHasPlan($plans_hotspot, $router['name']) || Validator::isRouterHasPlan($plans_pppoe, $router['name']) || Validator::isRouterHasPlan($plans_vpn, $router['name'])}
                <div class="box box-primary">
                    <div class="box-header text-bold">{$router['name']}</div>
                    {if $router['description'] != ''}
                        <div class="box-body">{$router['description']}</div>
                    {/if}
                    <div class="box-body row">
                         <!-- Hotspot Plans -->
                        {if $_user['service_type'] == 'Hotspot' && Validator::countRouterPlan($plans_hotspot, $router['name'])>0}
                            {foreach $plans_hotspot as $plan}
                                {if $router['name'] eq $plan['routers']}
                                    <div class="col-md-4 col-sm-6">
                                        <div class="panel panel-default plan-card">
                                            <div class="panel-heading text-center">{$plan['name_plan']}</div>
                                            <div class="panel-body text-center">
                                                <h3>{Lang::moneyFormat($plan['price'])}</h3>
                                                <ul class="list-unstyled">
                                                    <li>{Lang::T('Type')}: {$plan['type']}</li>
                                                    <li>{Lang::T('Validity')}: {$plan['validity']} {$plan['validity_unit']}</li>
                                                </ul>
                                                <a href="{Text::url('order/gateway/', $router['id'],'/',$plan['id'], '&stoken=', App::getToken())}"
                                                    onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                                    class="btn btn-primary btn-block">{Lang::T('Buy')}</a>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        {/if}

                        <!-- PPPoE Plans -->
                        {if $_user['service_type'] == 'PPPoE' && Validator::countRouterPlan($plans_pppoe,$router['name'])>0}
                            {foreach $plans_pppoe as $plan}
                                {if $router['name'] eq $plan['routers']}
                                    <div class="col-md-4 col-sm-6">
                                        <div class="panel panel-default plan-card">
                                            <div class="panel-heading text-center">{$plan['name_plan']}</div>
                                            <div class="panel-body text-center">
                                                <h3>{Lang::moneyFormat($plan['price'])}</h3>
                                                <ul class="list-unstyled">
                                                    <li>{Lang::T('Type')}: {$plan['type']}</li>
                                                    <li>{Lang::T('Validity')}: {$plan['validity']} {$plan['validity_unit']}</li>
                                                </ul>
                                                <a href="{Text::url('order/gateway/', $router['id'], '/', $plan['id'], '&stoken=', App::getToken())}"
                                                    onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                                    class="btn btn-primary btn-block">{Lang::T('Buy')}</a>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        {/if}

                        <!-- Catch-all for others/empty service type -->
                        {if $_user['service_type'] == 'Others' || $_user['service_type'] == ''}
                             {foreach $plans_hotspot as $plan}
                                {if $router['name'] eq $plan['routers']}
                                    <div class="col-md-4 col-sm-6">
                                        <div class="panel panel-default plan-card">
                                            <div class="panel-heading text-center">{$plan['name_plan']}</div>
                                            <div class="panel-body text-center">
                                                <h3>{Lang::moneyFormat($plan['price'])}</h3>
                                                <a href="{Text::url('order/gateway/', $router['id'],'/', $plan['id'], '&stoken=',App::getToken())}"
                                                    onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                                    class="btn btn-primary btn-block">{Lang::T('Buy')}</a>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        {/if}
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>
</div>

{include file="customer/footer.tpl"}
{include file="customer/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <!-- Title Card -->
        <div class="card mb-4">
            <div class="card-header">
                <i data-feather="shopping-cart" style="margin-right: 8px;"></i> {Lang::T('Order Internet Package')}
            </div>
        </div>

        <!-- Plan Loops -->
        {if $_c['radius_enable']}
            {if $_user['service_type'] == 'PPPoE'}
                {if Lang::arrayCount($radius_pppoe)>0}
                    <div class="mb-4">
                        <h3 class="mb-4" style="font-size: 1.25rem; padding-left: 1rem; border-left: 4px solid var(--primary);">
                            {if $_c['radius_plan']==''}Radius Plan{else}{$_c['radius_plan']}{/if} /
                            {if $_c['pppoe_plan']==''}PPPOE Plan{else}{$_c['pppoe_plan']}{/if}
                        </h3>
                        <div class="pricing-grid">
                            {foreach $radius_pppoe as $plan}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">
                                        {Lang::moneyFormat($plan['price'])}
                                    </div>
                                    {if !empty($plan['price_old'])}
                                        <div style="text-decoration: line-through; color: var(--danger); margin-bottom: 1rem;">
                                            {Lang::moneyFormat($plan['price_old'])}
                                        </div>
                                    {/if}
                                    <div class="price-unit">
                                        {$plan['validity']} {$plan['validity_unit']}
                                    </div>

                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">

                                    <div style="margin-bottom: 1.5rem;">
                                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                            <span class="text-muted">{Lang::T('Type')}</span>
                                            <strong>{$plan['type']}</strong>
                                        </div>
                                        {if $_c['show_bandwidth_plan'] == 'yes'}
                                            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                                <span class="text-muted">{Lang::T('Bandwidth')}</span>
                                                <strong api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}">...</strong>
                                            </div>
                                        {/if}
                                    </div>

                                    <a href="{Text::url('order/gateway/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                        onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                        class="btn btn-primary btn-block">
                                        {Lang::T('Buy Now')}
                                    </a>

                                    {if $_c['enable_balance'] == 'yes' && $_c['allow_balance_transfer'] == 'yes' && $_user['balance']>=$plan['price']}
                                        <a href="{Text::url('order/send/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                            onclick="return ask(this, '{Lang::T('Buy this for friend account?')}')"
                                            class="btn btn-success btn-block" style="margin-top: 0.5rem;">
                                            <i data-feather="send" style="width: 16px; margin-right: 6px;"></i> {Lang::T('Buy for friend')}
                                        </a>
                                    {/if}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

            {elseif $_user['service_type'] == 'Hotspot'}
                {if Lang::arrayCount($radius_hotspot)>0}
                    <div class="mb-4">
                        <h3 class="mb-4" style="font-size: 1.25rem; padding-left: 1rem; border-left: 4px solid var(--primary);">
                            {if $_c['radius_plan']==''}Radius Plan{else}{$_c['radius_plan']}{/if} /
                            {if $_c['hotspot_plan']==''}Hotspot Plan{else}{$_c['hotspot_plan']}{/if}
                        </h3>
                        <div class="pricing-grid">
                            {foreach $radius_hotspot as $plan}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">
                                        {Lang::moneyFormat($plan['price'])}
                                    </div>
                                    {if !empty($plan['price_old'])}
                                        <div style="text-decoration: line-through; color: var(--danger); margin-bottom: 1rem;">
                                            {Lang::moneyFormat($plan['price_old'])}
                                        </div>
                                    {/if}
                                    <div class="price-unit">
                                        {$plan['validity']} {$plan['validity_unit']}
                                    </div>

                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">

                                    <div style="margin-bottom: 1.5rem;">
                                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                            <span class="text-muted">{Lang::T('Type')}</span>
                                            <strong>{$plan['type']}</strong>
                                        </div>
                                        {if $_c['show_bandwidth_plan'] == 'yes'}
                                            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                                <span class="text-muted">{Lang::T('Bandwidth')}</span>
                                                <strong api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}">...</strong>
                                            </div>
                                        {/if}
                                    </div>

                                    <a href="{Text::url('order/gateway/radius/',$plan['id'],'&stoken=',App::getToken())}"
                                        onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                        class="btn btn-primary btn-block">
                                        {Lang::T('Buy Now')}
                                    </a>

                                    {if $_c['enable_balance'] == 'yes' && $_c['allow_balance_transfer'] == 'yes' && $_user['balance']>=$plan['price']}
                                        <a href="{Text::url('order/send/radius/', $plan['id'], '&stoken=', App::getToken())}"
                                            onclick="return ask(this, '{Lang::T('Buy this for friend account?')}')"
                                            class="btn btn-success btn-block" style="margin-top: 0.5rem;">
                                            <i data-feather="send" style="width: 16px; margin-right: 6px;"></i> {Lang::T('Buy for friend')}
                                        </a>
                                    {/if}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

            {elseif $_user['service_type'] == 'Others' || $_user['service_type'] == ''}
                <!-- Mixed Types for Others -->
                {if Lang::arrayCount($radius_pppoe)>0}
                    <div class="mb-4">
                        <h3 class="mb-4" style="font-size: 1.25rem; padding-left: 1rem; border-left: 4px solid var(--primary);">
                           {if $_c['pppoe_plan']==''}PPPOE Plan{else}{$_c['pppoe_plan']}{/if}
                        </h3>
                        <div class="pricing-grid">
                            {foreach $radius_pppoe as $plan}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">
                                        {Lang::moneyFormat($plan['price'])}
                                    </div>
                                    <div class="price-unit">
                                        {$plan['validity']} {$plan['validity_unit']}
                                    </div>
                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">
                                    <a href="{Text::url('order/gateway/pppoe/',$plan['id'],'&stoken=',App::getToken())}" class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                {if Lang::arrayCount($radius_hotspot)>0}
                    <div class="mb-4">
                        <h3 class="mb-4" style="font-size: 1.25rem; padding-left: 1rem; border-left: 4px solid var(--primary);">
                           {if $_c['hotspot_plan']==''}Hotspot Plan{else}{$_c['hotspot_plan']}{/if}
                        </h3>
                        <div class="pricing-grid">
                            {foreach $radius_hotspot as $plan}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">
                                        {Lang::moneyFormat($plan['price'])}
                                    </div>
                                    <div class="price-unit">
                                        {$plan['validity']} {$plan['validity_unit']}
                                    </div>
                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">
                                    <a href="{Text::url('order/gateway/hotspot/',$plan['id'],'&stoken=',App::getToken())}" class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}
            {/if}
        {/if}

        <!-- Router Plans Logic -->
        {foreach $routers as $router}
            {if Validator::isRouterHasPlan($plans_hotspot, $router['name']) || Validator::isRouterHasPlan($plans_pppoe, $router['name']) || Validator::isRouterHasPlan($plans_vpn, $router['name'])}

                <div class="mb-4">
                    <h3 class="mb-4" style="font-size: 1.25rem; padding-left: 1rem; border-left: 4px solid var(--primary);">
                        {$router['name']}
                    </h3>
                    {if $router['description'] != ''}
                        <p class="text-muted">{$router['description']}</p>
                    {/if}

                    <!-- Hotspot Plans for this Router -->
                    {if $_user['service_type'] == 'Hotspot' && Validator::countRouterPlan($plans_hotspot, $router['name'])>0}
                        <div class="pricing-grid">
                        {foreach $plans_hotspot as $plan}
                            {if $router['name'] eq $plan['routers']}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">{Lang::moneyFormat($plan['price'])}</div>
                                    <div class="price-unit">{$plan['validity']} {$plan['validity_unit']}</div>

                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">

                                    {if $_c['show_bandwidth_plan'] == 'yes'}
                                        <div class="text-muted mb-4" api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}"></div>
                                    {/if}

                                    <a href="{Text::url('order/gateway/', $router['id'],'/',$plan['id'], '&stoken=', App::getToken())}"
                                        onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                        class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                </div>
                            {/if}
                        {/foreach}
                        </div>
                    {/if}

                    <!-- PPPoE Plans for this Router -->
                    {if $_user['service_type'] == 'PPPoE' && Validator::countRouterPlan($plans_pppoe,$router['name'])>0}
                         <div class="pricing-grid">
                        {foreach $plans_pppoe as $plan}
                            {if $router['name'] eq $plan['routers']}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">{Lang::moneyFormat($plan['price'])}</div>
                                    <div class="price-unit">{$plan['validity']} {$plan['validity_unit']}</div>

                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">

                                    {if $_c['show_bandwidth_plan'] == 'yes'}
                                        <div class="text-muted mb-4" api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}"></div>
                                    {/if}

                                    <a href="{Text::url('order/gateway/', $router['id'], '/', $plan['id'], '&stoken=', App::getToken())}"
                                        onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                        class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                </div>
                            {/if}
                        {/foreach}
                        </div>
                    {/if}

                    <!-- VPN Plans for this Router -->
                    {if $_user['service_type'] == 'VPN' && Validator::countRouterPlan($plans_vpn,$router['name'])>0}
                         <div class="pricing-grid">
                        {foreach $plans_vpn as $plan}
                            {if $router['name'] eq $plan['routers']}
                                <div class="pricing-card">
                                    <h4 style="font-size: 1.5rem;">{$plan['name_plan']}</h4>
                                    <div class="price-tag">{Lang::moneyFormat($plan['price'])}</div>
                                    <div class="price-unit">{$plan['validity']} {$plan['validity_unit']}</div>

                                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 1.5rem 0;">

                                    {if $_c['show_bandwidth_plan'] == 'yes'}
                                        <div class="text-muted mb-4" api-get-text="{Text::url('autoload_user/bw_name/')}{$plan['id_bw']}"></div>
                                    {/if}

                                    <a href="{Text::url('order/gateway/',$router['id'],'/',$plan['id'],'&stoken=', App::getToken())}"
                                        onclick="return ask(this, '{Lang::T('Buy this? your active package will be overwrite')}')"
                                        class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                </div>
                            {/if}
                        {/foreach}
                        </div>
                    {/if}

                    <!-- Mixed Types for Router -->
                    {if $_user['service_type'] == 'Others' || $_user['service_type'] == '' && (Validator::countRouterPlan($plans_hotspot, $router['name'])>0 || Validator::countRouterPlan($plans_pppoe, $router['name'])>0 || Validator::countRouterPlan($plans_vpn, $router['name'])>0)}
                        <!-- Similar logic for mixed types can be added here if needed, following the pattern above but checking all types -->
                         <div class="pricing-grid">
                            <!-- Simplified fall-through for mixed types -->
                            {foreach $plans_hotspot as $plan}
                                {if $router['name'] eq $plan['routers']}
                                    <div class="pricing-card">
                                        <h4 style="font-size: 1.5rem;">{$plan['name_plan']} (Hotspot)</h4>
                                        <div class="price-tag">{Lang::moneyFormat($plan['price'])}</div>
                                        <a href="{Text::url('order/gateway/', $router['id'],'/', $plan['id'], '&stoken=',App::getToken())}" class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                    </div>
                                {/if}
                            {/foreach}
                            {foreach $plans_pppoe as $plan}
                                {if $router['name'] eq $plan['routers']}
                                    <div class="pricing-card">
                                        <h4 style="font-size: 1.5rem;">{$plan['name_plan']} (PPPoE)</h4>
                                        <div class="price-tag">{Lang::moneyFormat($plan['price'])}</div>
                                        <a href="{Text::url('order/gateway/', $router['id'], '/', $plan['id'], '&stoken=', App::getToken())}" class="btn btn-primary btn-block">{Lang::T('Buy Now')}</a>
                                    </div>
                                {/if}
                            {/foreach}
                         </div>
                    {/if}

                </div>
            {/if}
        {/foreach}

    </div>
</div>

{include file="customer/footer.tpl"}
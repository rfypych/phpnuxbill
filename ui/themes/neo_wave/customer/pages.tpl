{include file="customer/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">{$_L[$pageHeader]}</div>
            <div class="panel-body">
                {include file="$PAGES_PATH/$PageFile.html"}
            </div>
        </div>
    </div>
</div>

{include file="customer/footer.tpl"}
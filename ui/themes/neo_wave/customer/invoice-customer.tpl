{if empty($_user)}
    {include file="customer/header-public.tpl"}
{else}
    {include file="customer/header.tpl"}
{/if}

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">{Lang::T('Invoice')} #{$in['invoice']}</div>
            <div class="panel-body text-center">
                {if !empty($logo)}
                    <img src="{$app_url}/{$logo}" style="max-height: 60px; margin-bottom: 20px;">
                {/if}

                <form class="form-horizontal" method="post" action="{Text::url('plan/print')}" target="_blank">
                    <div class="invoice-paper" style="background: #fff; padding: 20px; border: 1px solid #ddd; position: relative;">
                        <pre id="content" style="border: 0; background: transparent; font-family: 'Courier New', Courier, monospace; white-space: pre-wrap;">{$invoice}</pre>
                        <img src="{$app_url}/system/uploads/paid.png" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); opacity: 0.2; pointer-events: none;">
                    </div>

                    <input type="hidden" name="id" value="{$in['id']}">

                    <div style="margin-top: 20px; display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
                        {if !empty($_user)}
                            <a href="{Text::url('voucher/list-activated')}" class="btn btn-default">
                                <i class="ion ion-reply"></i> {Lang::T('Back')}
                            </a>
                        {/if}

                        <button type="button" onclick="download()" class="btn btn-success">
                            <i class="fa fa-download"></i> PDF
                        </button>

                        <a href="https://api.whatsapp.com/send/?text={$whatsapp}" target="_blank" class="btn btn-success">
                            <i class="fa fa-whatsapp"></i> WhatsApp
                        </a>
                    </div>

                    <div style="margin-top: 15px;">
                         <input type="text" class="form-control text-center" readonly onclick="this.select()" value="{$public_url}" style="font-size: 0.9em;">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const canvas = document.createElement("canvas");
    const ctx = canvas.getContext('2d');
    ctx.font = '16px Courier';
    var text = document.getElementById("content").innerHTML;
    var lines = text.split(/\r\n|\r|\n/).length;

    let width = Math.round({$_c['printer_cols']} * 9.6);
    var height = Math.round((14 * lines));

    var paid = new Image();
    paid.src = '{$app_url}/system/uploads/paid.png';

    {if !empty($logo)}
        var img = new Image();
        img.src = '{$app_url}/{$logo}?{time()}';
        var new_width = (width / 4) * 2;
        var new_height = Math.ceil({$hlogo} * (new_width/{$wlogo}));
        height = height + new_height;
    {/if}

    function download() {
        var doc = new jsPDF('p', 'px', [width, height]);
        {if !empty($logo)}
            try {
                doc.addImage(img, 'PNG', (width - new_width) / 2, 10, new_width, new_height);
            } catch (err) {}
        {/if}
        try {
            doc.addImage(paid, 'PNG', (width - 200) / 2, (height - 145) / 2, 200, 145);
        } catch (err) {}

        doc.setFont("Courier");
        doc.setFontSize(16);
        doc.text($('#content').text(), width / 2, new_height + 30, 'center');
        doc.save('{$in['invoice']}.pdf');
    }
</script>

{include file="customer/footer.tpl"}
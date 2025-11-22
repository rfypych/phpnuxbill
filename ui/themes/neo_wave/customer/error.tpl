<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{ucwords(Lang::T("Error"))} - {$_c['CompanyName']}</title>
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/neo-wave.css">
</head>
<body style="background: var(--bg-body); display: flex; align-items: center; justify-content: center; height: 100vh;">

    <div style="max-width: 500px; width: 100%; padding: 20px;">
        <div class="panel panel-danger">
            <div class="panel-heading text-center">{ucwords(Lang::T("Internal Error"))}</div>
            <div class="panel-body text-center">
                <p>{Lang::T("Sorry, the software failed to process the request.")}</p>
                <p>{$_c['CompanyName']}</p>
            </div>
            <div class="panel-footer">
                <a href="{$url}" class="btn btn-danger btn-block">{Lang::T('Try Again')}</a>
            </div>
        </div>
    </div>

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$_title} - {$_c['CompanyName']}</title>
    <link rel="shortcut icon" href="{$app_url}/ui/themes/neo_wave/images/logo.png" type="image/x-icon" />

    <!-- Dependencies -->
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/fonts/font-awesome/css/font-awesome.min.css">

    <!-- Neo Wave Theme CSS -->
    <link rel="stylesheet" href="{$app_url}/ui/themes/neo_wave/styles/neo-wave.css?v=1.0">

    {if isset($xheader)}
        {$xheader}
    {/if}
</head>

<body class="login-page">
    <script>
        if (localStorage.getItem('mode') === 'dark') {
            document.body.classList.add('dark-mode');
        }
    </script>

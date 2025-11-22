# Neo Wave Theme for PHPNuxBill

Neo Wave is a modern, responsive theme for the PHPNuxBill customer portal. It replaces the legacy AdminLTE style with a cleaner, card-based interface while maintaining full backward compatibility.

## Directory Structure

```
ui/themes/neo_wave/
├── customer/           # Template files (.tpl)
│   ├── dashboard.tpl   # Dashboard with widget grid
│   ├── login.tpl       # Login page
│   ├── orderPlan.tpl   # Plan purchasing page
│   ├── ...             # Other functional templates
├── styles/             # CSS files
│   ├── neo-wave.css    # Main theme styles (Dark mode, Variables)
├── scripts/            # JS files
│   ├── custom.js       # Theme logic
│   ├── ...             # Dependencies (jQuery, etc.)
├── images/             # Theme assets
├── fonts/              # Icon fonts (Ionicons, FontAwesome)
```

## Installation

1. **Activate Theme**:
   - Login to the PHPNuxBill Admin Panel.
   - Go to **Settings -> Theme -> Customer Theme**.
   - Select **neo_wave**.
   - Save changes.

## Features

- **Modern UI**: Clean card-based layout with CSS variables.
- **Dark Mode**: Built-in toggle with localStorage persistence.
- **Responsive**: Fully mobile-friendly sidebar and grid.
- **Compatibility**: Supports all existing PHPNuxBill features (Hotspot, PPPoE, Vouchers, Payment Gateways).

## Customization

To customize colors or styles, edit `ui/themes/neo_wave/styles/neo-wave.css`. The theme uses CSS variables for easy theming:

```css
:root {
    --primary-color: #4e73df;
    --bg-body: #f3f5f9;
    /* ... */
}
```

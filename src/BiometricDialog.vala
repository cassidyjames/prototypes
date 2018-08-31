/*
* Copyright (c) 2018 Cassidy James Blaede (https://cassidyjames.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Cassidy James Blaede <c@ssidyjam.es>
*/

public class BiometricDialog : Gtk.Dialog {
    private string CSS = """
        /*
        .fingerprint {
            color: @STRAWBERRY_500;
        }

        .smart-key {
            color: @GRAPE_700;
        }

        .bluetooth {
            color: @BLUEBERRY_500;
        }

        .face {
            color: @BANANA_900;
        }
        */
    """;

    public BiometricDialog () {
        Object (
            deletable: false,
            icon_name: "dialog-password",
            resizable: false,
            skip_taskbar_hint: true,
            skip_pager_hint: true,
            title: _("Authorize"),
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        var image = new Gtk.Image.from_icon_name ("dialog-password", Gtk.IconSize.DIALOG);
        image.valign = Gtk.Align.START;

        var overlay = new Gtk.Overlay ();
        overlay.valign = Gtk.Align.START;
        overlay.add (image);

        string icon_name = "system-software-install";
        if (icon_name != "" && Gtk.IconTheme.get_default ().has_icon (icon_name)) {
            var overlay_image = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.LARGE_TOOLBAR);
            overlay_image.halign = overlay_image.valign = Gtk.Align.END;
            overlay.add_overlay (overlay_image);
        }

        var primary_label = new Gtk.Label (_("Authentication Required"));
        primary_label.max_width_chars = 50;
        primary_label.selectable = true;
        primary_label.wrap = true;
        primary_label.xalign = 0;
        primary_label.get_style_context ().add_class ("primary");

        var secondary_label = new Gtk.Label (_("You must authenticate to install apps. You can use:"));
        secondary_label.max_width_chars = 48;
        secondary_label.selectable = true;
        secondary_label.wrap = true;
        secondary_label.xalign = 0;

        var fingerprint_icon = new Gtk.Image.from_icon_name ("fingerprint-symbolic", Gtk.IconSize.MENU);
        fingerprint_icon.margin_start = 4;
        fingerprint_icon.get_style_context ().add_class ("accent");
        fingerprint_icon.get_style_context ().add_class ("fingerprint");

        var fingerprint_label = new Gtk.Label (_("Fingerprint"));
        fingerprint_label.hexpand = true;
        fingerprint_label.xalign = 0;

        var fingerprint_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        fingerprint_success.visible = false;
        fingerprint_success.no_show_all = true;

        var smart_key_icon = new Gtk.Image.from_icon_name ("drive-removable-media-symbolic", Gtk.IconSize.MENU);
        smart_key_icon.margin_start = 4;
        smart_key_icon.get_style_context ().add_class ("accent");
        smart_key_icon.get_style_context ().add_class ("smart-key");

        var smart_key_label = new Gtk.Label (_("Removable Key"));
        smart_key_label.hexpand = true;
        smart_key_label.xalign = 0;

        var smart_key_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        smart_key_success.visible = false;
        smart_key_success.no_show_all = true;

        var bluetooth_icon = new Gtk.Image.from_icon_name ("bluetooth-symbolic", Gtk.IconSize.MENU);
        bluetooth_icon.margin_start = 4;
        // bluetooth_icon.get_style_context ().add_class ("accent");
        bluetooth_icon.get_style_context ().add_class ("bluetooth");
        bluetooth_icon.get_style_context ().add_class ("success");

        var bluetooth_label = new Gtk.Label (_("Paired Device"));
        bluetooth_label.hexpand = true;
        bluetooth_label.xalign = 0;
        bluetooth_label.get_style_context ().add_class ("success");

        var bluetooth_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        bluetooth_success.visible = false;

        var face_icon = new Gtk.Image.from_icon_name ("face-smile-symbolic", Gtk.IconSize.MENU);
        face_icon.margin_start = 4;
        face_icon.get_style_context ().add_class ("accent");
        face_icon.get_style_context ().add_class ("face");

        var face_label = new Gtk.Label (_("Facial Recognition"));
        face_label.hexpand = true;
        face_label.xalign = 0;

        var face_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        face_success.visible = false;
        face_success.no_show_all = true;

        var password_entry = new Gtk.Entry ();
        password_entry.placeholder_text = _("Password");
        password_entry.set_icon_from_icon_name (Gtk.EntryIconPosition.PRIMARY, "dialog-password-symbolic");
        // password_entry.sensitive = false;

        var methods_grid = new Gtk.Grid ();
        methods_grid.column_spacing = 6;
        methods_grid.margin_top = methods_grid.margin_bottom = 6;
        methods_grid.row_spacing = 12;
        methods_grid.row_spacing = 12;

        methods_grid.attach (fingerprint_icon,    0, 0);
        methods_grid.attach (fingerprint_label,   1, 0);
        methods_grid.attach (fingerprint_success, 2, 0);
        // methods_grid.attach (smart_key_icon,      0, 1);
        // methods_grid.attach (smart_key_label,     1, 1);
        // methods_grid.attach (smart_key_success,   2, 1);
        methods_grid.attach (bluetooth_icon,      0, 2);
        methods_grid.attach (bluetooth_label,     1, 2);
        methods_grid.attach (bluetooth_success,   2, 2);
        // methods_grid.attach (face_icon,           0, 3);
        // methods_grid.attach (face_label,          1, 3);
        // methods_grid.attach (face_success,        2, 3);
        methods_grid.attach (password_entry,      0, 4, 3);

        var cancel_button = (Gtk.Button) add_button (_("Cancel"), Gtk.ResponseType.CANCEL);

        var authenticate_button = (Gtk.Button) add_button (_("Authenticate"), Gtk.ResponseType.OK);
        authenticate_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        var grid = new Gtk.Grid ();
        grid.column_spacing = 12;
        grid.margin_start = grid.margin_end = 12;
        grid.row_spacing = 6;

        grid.attach (overlay,         0, 0, 1, 2);
        grid.attach (primary_label,   1, 0);
        grid.attach (secondary_label, 1, 1);
        grid.attach (methods_grid,    1, 2);

        grid.show_all ();
        get_content_area ().add (grid);

        var action_area = get_action_area ();
        action_area.margin = 6;
        action_area.margin_top = 12;

        set_keep_above (true);

        cancel_button.clicked.connect (() => destroy ());
        authenticate_button.clicked.connect (() => destroy ());

        var provider = new Gtk.CssProvider ();
        try {
            provider.load_from_data (CSS, CSS.length);
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        } catch (GLib.Error e) {
            return;
        }
    }
}


/*
* Copyright 2018–2021 Cassidy James Blaede (https://cassidyjames.com)
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

public class BiometricDialog : Granite.MessageDialog {
    private string CSS = """
        .fingerprint {
            color: @STRAWBERRY_300;
        }

        .smart-key {
            color: @SLATE_500;
        }

        .bluetooth {
            color: @BLUEBERRY_500;
        }

        .face {
            color: @BANANA_700;
        }
    """;

    public BiometricDialog () {
        Object (
            badge_icon: new ThemedIcon ("system-software-install"),
            image_icon: new ThemedIcon ("dialog-password"),
            primary_text: "Authentication Required",
            secondary_text: "You must authenticate to install apps. You can use:",
            title: "Authorize"
        );
    }

    construct {
        var fingerprint_icon = new Gtk.Image.from_icon_name ("fingerprint-symbolic", Gtk.IconSize.MENU);
        fingerprint_icon.margin_start = 4;
        fingerprint_icon.get_style_context ().add_class ("fingerprint");

        var fingerprint_label = new Gtk.Label ("Fingerprint");
        fingerprint_label.hexpand = true;
        fingerprint_label.xalign = 0;

        var fingerprint_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        fingerprint_success.visible = false;
        fingerprint_success.no_show_all = true;

        var smart_key_icon = new Gtk.Image.from_icon_name ("drive-removable-media-symbolic", Gtk.IconSize.MENU);
        smart_key_icon.margin_start = 4;
        smart_key_icon.get_style_context ().add_class ("smart-key");

        var smart_key_label = new Gtk.Label ("Removable Key");
        smart_key_label.hexpand = true;
        smart_key_label.xalign = 0;

        var smart_key_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        smart_key_success.visible = false;
        smart_key_success.no_show_all = true;

        var bluetooth_icon = new Gtk.Image.from_icon_name ("preferences-bluetooth-symbolic", Gtk.IconSize.MENU);
        bluetooth_icon.margin_start = 4;
        bluetooth_icon.get_style_context ().add_class ("bluetooth");

        var bluetooth_label = new Gtk.Label ("Paired Device");
        bluetooth_label.hexpand = true;
        bluetooth_label.xalign = 0;
        bluetooth_label.get_style_context ().add_class ("success");

        var bluetooth_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        bluetooth_success.visible = false;

        var face_icon = new Gtk.Image.from_icon_name ("face-smile-symbolic", Gtk.IconSize.MENU);
        face_icon.margin_start = 4;
        face_icon.get_style_context ().add_class ("face");

        var face_label = new Gtk.Label ("Facial Recognition");
        face_label.hexpand = true;
        face_label.xalign = 0;

        var face_success = new Gtk.Image.from_icon_name ("process-completed-symbolic", Gtk.IconSize.MENU);
        face_success.visible = false;
        face_success.no_show_all = true;

        var password_entry = new Gtk.Entry ();
        password_entry.placeholder_text = "Password";
        password_entry.set_icon_from_icon_name (Gtk.EntryIconPosition.PRIMARY, "dialog-password-symbolic");
        password_entry.sensitive = false;

        var methods_grid = new Gtk.Grid ();
        methods_grid.column_spacing = 6;
        methods_grid.margin_top = methods_grid.margin_bottom = 6;
        methods_grid.row_spacing = 12;

        methods_grid.attach (fingerprint_icon, 0, 0);
        methods_grid.attach (fingerprint_label, 1, 0);
        methods_grid.attach (fingerprint_success, 2, 0);
        methods_grid.attach (smart_key_icon, 0, 1);
        methods_grid.attach (smart_key_label, 1, 1);
        methods_grid.attach (smart_key_success, 2, 1);
        methods_grid.attach (bluetooth_icon, 0, 2);
        methods_grid.attach (bluetooth_label, 1, 2);
        methods_grid.attach (bluetooth_success, 2, 2);
        methods_grid.attach (face_icon, 0, 3);
        methods_grid.attach (face_label, 1, 3);
        methods_grid.attach (face_success, 2, 3);
        methods_grid.attach (password_entry, 0, 4, 3);

        var cancel_button = add_button ("Cancel", Gtk.ResponseType.CANCEL) as Gtk.Button;

        var authenticate_button = add_button ("Authenticate", Gtk.ResponseType.OK) as Gtk.Button;
        authenticate_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        custom_bin.add (methods_grid);
        custom_bin.show_all ();

        set_default (authenticate_button);
        authenticate_button.grab_focus ();

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


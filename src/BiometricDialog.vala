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

    public BiometricDialog () {
        Object (
            deletable: false,
            icon_name: "fingerprint-symbolic",
            resizable: false,
            skip_taskbar_hint: true,
            skip_pager_hint: true,
            title: _("Authorize"),
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        var image = new Gtk.Image.from_icon_name ("fingerprint-symbolic", Gtk.IconSize.DIALOG);
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

        var primary_label = new Gtk.Label (_("Touch to Install Nimbus"));
        primary_label.max_width_chars = 50;
        primary_label.selectable = true;
        primary_label.wrap = true;
        primary_label.xalign = 0;
        primary_label.get_style_context ().add_class ("primary");

        var secondary_label = new Gtk.Label (_("Authentication is required to install apps. Touch the fingerprint reader to authenticate, or use your password."));
        secondary_label.max_width_chars = 48;
        secondary_label.selectable = true;
        secondary_label.wrap = true;
        secondary_label.xalign = 0;

        var cancel_button = (Gtk.Button) add_button (_("Cancel"), Gtk.ResponseType.CANCEL);

        var password_button = (Gtk.Button) add_button (_("Use Password"), Gtk.ResponseType.OK);

        var grid = new Gtk.Grid ();
        grid.column_spacing = 12;
        grid.margin_start = grid.margin_end = 12;
        grid.row_spacing = 6;

        grid.attach (overlay, 0, 0, 1, 2);
        grid.attach (primary_label, 1, 0);
        grid.attach (secondary_label, 1, 1);

        grid.show_all ();
        get_content_area ().add (grid);

        var action_area = get_action_area ();
        action_area.margin = 6;
        action_area.margin_top = 12;

        set_keep_above (true);

        cancel_button.clicked.connect (() => destroy ());
        password_button.clicked.connect (() => destroy ());
    }
}


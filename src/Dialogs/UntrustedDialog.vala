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

public class UntrustedDialog : Gtk.Dialog {

    public UntrustedDialog () {
        Object (
            deletable: false,
            icon_name: "security-low",
            resizable: false,
            skip_taskbar_hint: true,
            skip_pager_hint: true,
            title: _("Install Untrusted Software"),
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        var image = new Gtk.Image.from_icon_name ("security-low", Gtk.IconSize.DIALOG);
        image.valign = Gtk.Align.START;

        var primary_label = new Gtk.Label (_("Install Untrusted Software?"));
        primary_label.max_width_chars = 50;
        primary_label.selectable = true;
        primary_label.wrap = true;
        primary_label.xalign = 0;
        primary_label.get_style_context ().add_class ("primary");

        var secondary_label = new Gtk.Label (_("This software is provided solely by its developer and has not been reviewed for security, privacy, or system integration."));
        secondary_label.max_width_chars = 55;
        secondary_label.selectable = true;
        secondary_label.wrap = true;
        secondary_label.xalign = 0;

        var cancel_button = (Gtk.Button) add_button (_("Cancel"), Gtk.ResponseType.CANCEL);

        var install_button = (Gtk.Button) add_button (_("Install"), Gtk.ResponseType.OK);
        install_button.sensitive = false;
        install_button.get_style_context ().add_class (Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

        var agree_check = new Gtk.CheckButton.with_label (_("I understand"));
        agree_check.margin_bottom = 6;
        agree_check.margin_top = 12;
        agree_check.bind_property ("active", install_button, "sensitive");

        var grid = new Gtk.Grid ();
        grid.column_spacing = 12;
        grid.margin_start = grid.margin_end = 12;
        grid.row_spacing = 6;

        grid.attach (image,           0, 0, 1, 2);
        grid.attach (primary_label,   1, 0);
        grid.attach (secondary_label, 1, 1);
        grid.attach (agree_check,     1, 2);

        grid.show_all ();
        get_content_area ().add (grid);

        var action_area = get_action_area ();
        action_area.margin = 6;
        action_area.margin_top = 12;

        set_keep_above (true);

        cancel_button.clicked.connect (() => destroy ());
        install_button.clicked.connect (() => destroy ());
    }
}


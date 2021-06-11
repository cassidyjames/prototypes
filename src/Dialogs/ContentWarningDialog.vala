/*
* Copyright 2018–2021 Cassidy James Blaede (https://cassidyjames.com)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

public class ContentWarningDialog : Granite.MessageDialog {
    public string app_name { get; construct set; }

    public ContentWarningDialog (string _app_name) {
        Object (
            app_name: _app_name,
            image_icon: new ThemedIcon ("dialog-warning"),
            title: "Content Warning"
        );
    }

    construct {
        primary_text = "%s Contains Explicit Content".printf (app_name);
        secondary_text = "%s may contain content only suitable for adults or that may be sensitive or disturbing. In general, elementary does not review or endorse the contents of this app.".printf (app_name);

        var check = new Gtk.CheckButton.with_label ("Show content warnings");
        check.active = true;

        var cancel = add_button ("Don’t Install", Gtk.ResponseType.CANCEL) as Gtk.Button;
        cancel.clicked.connect (() => { destroy (); });

        var install = add_button ("Install Anyway", Gtk.ResponseType.OK) as Gtk.Button;

        custom_bin.add (check);
        set_default (install);
        install.grab_focus ();
    }
}


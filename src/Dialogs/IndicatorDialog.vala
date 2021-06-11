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

public class IndicatorDialog : Granite.MessageDialog {

    public IndicatorDialog () {
        Object (
            image_icon: new ThemedIcon ("preferences-desktop"),
            primary_text: "Add Indicator?",
            secondary_text: "This indicator may appear in the Panel whether or not an associated app is running or open. To disable it later, you can visit System Settings.",
            title: "Add Indicator",
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        var cancel_button = add_button ("Cancel", Gtk.ResponseType.CANCEL) as Gtk.Button;

        var allow_button = add_button ("Authenticate", Gtk.ResponseType.OK) as Gtk.Button;
        allow_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        set_keep_above (true);

        cancel_button.clicked.connect (() => destroy ());
        allow_button.clicked.connect (() => destroy ());
    }
}


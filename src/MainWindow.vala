/*
* Copyright 2021 Cassidy James Blaede (https://cassidyjames.com)
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

public class MainWindow : Hdy.Window {
    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            resizable: false,
            title: "Demos"
        );
    }

    construct {
        Hdy.init ();

        var biometric_button = new Gtk.Button.with_label ("Biometric Authentication");
        var content_warning_button = new Gtk.Button.with_label ("Content Warning");
        var indicator_button = new Gtk.Button.with_label ("Indicator Dialog");
        var untrusted_button = new Gtk.Button.with_label ("Untrusted Dialog");

        var button_grid = new Gtk.Grid () {
            margin = 12,
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6
        };
        button_grid.add (biometric_button);
        button_grid.add (content_warning_button);
        button_grid.add (indicator_button);
        button_grid.add (untrusted_button);

        var headerbar = new Hdy.HeaderBar () {
            show_close_button = true,
            title = "Demos"
        };

        var headerbar_context = headerbar.get_style_context ();
        headerbar_context.add_class ("default-decoration");
        headerbar_context.add_class (Gtk.STYLE_CLASS_FLAT);

        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL
        };
        grid.add (headerbar);
        grid.add (button_grid);

        var window_handle = new Hdy.WindowHandle ();
        window_handle.add (grid);

        add (window_handle);

        biometric_button.clicked.connect (() => {
            var biometric_dialog = new BiometricDialog ();
            biometric_dialog.run ();
        });

        content_warning_button.clicked.connect (() => {
            var content_warning_dialog = new ContentWarningDialog ("FooBar");
            content_warning_dialog.run ();
        });

        indicator_button.clicked.connect (() => {
            var indicator_dialog = new IndicatorDialog ();
            indicator_dialog.run ();
        });

        untrusted_button.clicked.connect (() => {
            var untrusted_dialog = new UntrustedDialog ();
            untrusted_dialog.run ();
        });
    }
}

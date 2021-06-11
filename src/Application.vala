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

public class Untrusted : Gtk.Application {
    public Untrusted () {
        Object (application_id: "com.github.cassidyjames.agents",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        // var window = new UntrustedDialog ();
        // var window = new IndicatorDialog ();
        // var window = new BiometricDialog ();
        // var window = new ContentWarningDialog ("FooBar");

        var window = new MainWindow (this);

        window.show_all ();
        this.add_window (window);

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit", {"Escape"});

        quit_action.activate.connect (() => {
            if (window != null) {
                window.destroy ();
            }
        });
    }

    private static int main (string[] args) {
        Gtk.init (ref args);

        var app = new Untrusted ();
        return app.run (args);
    }
}


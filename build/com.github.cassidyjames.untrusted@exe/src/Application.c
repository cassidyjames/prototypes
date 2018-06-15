/* Application.c generated by valac 0.40.4, the Vala compiler
 * generated from Application.vala, do not modify */

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


#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>
#include <gio/gio.h>
#include <stdlib.h>
#include <string.h>


#define TYPE_UNTRUSTED (untrusted_get_type ())
#define UNTRUSTED(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_UNTRUSTED, Untrusted))
#define UNTRUSTED_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_UNTRUSTED, UntrustedClass))
#define IS_UNTRUSTED(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_UNTRUSTED))
#define IS_UNTRUSTED_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_UNTRUSTED))
#define UNTRUSTED_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_UNTRUSTED, UntrustedClass))

typedef struct _Untrusted Untrusted;
typedef struct _UntrustedClass UntrustedClass;
typedef struct _UntrustedPrivate UntrustedPrivate;
enum  {
	UNTRUSTED_0_PROPERTY,
	UNTRUSTED_NUM_PROPERTIES
};
static GParamSpec* untrusted_properties[UNTRUSTED_NUM_PROPERTIES];

#define TYPE_MAIN_WINDOW (main_window_get_type ())
#define MAIN_WINDOW(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_MAIN_WINDOW, MainWindow))
#define MAIN_WINDOW_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_MAIN_WINDOW, MainWindowClass))
#define IS_MAIN_WINDOW(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_MAIN_WINDOW))
#define IS_MAIN_WINDOW_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_MAIN_WINDOW))
#define MAIN_WINDOW_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_MAIN_WINDOW, MainWindowClass))

typedef struct _MainWindow MainWindow;
typedef struct _MainWindowClass MainWindowClass;
typedef struct _Block1Data Block1Data;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))

struct _Untrusted {
	GtkApplication parent_instance;
	UntrustedPrivate * priv;
};

struct _UntrustedClass {
	GtkApplicationClass parent_class;
};

struct _Block1Data {
	int _ref_count_;
	Untrusted* self;
	MainWindow* window;
};


static gpointer untrusted_parent_class = NULL;

GType untrusted_get_type (void) G_GNUC_CONST;
Untrusted* untrusted_new (void);
Untrusted* untrusted_construct (GType object_type);
static void untrusted_real_activate (GApplication* base);
GType main_window_get_type (void) G_GNUC_CONST;
static Block1Data* block1_data_ref (Block1Data* _data1_);
static void block1_data_unref (void * _userdata_);
MainWindow* main_window_new (void);
MainWindow* main_window_construct (GType object_type);
static void __lambda6_ (Block1Data* _data1_);
static void ___lambda6__g_simple_action_activate (GSimpleAction* _sender,
                                           GVariant* parameter,
                                           gpointer self);
static gint untrusted_main (gchar** args,
                     int args_length1);
static void _vala_array_destroy (gpointer array,
                          gint array_length,
                          GDestroyNotify destroy_func);
static void _vala_array_free (gpointer array,
                       gint array_length,
                       GDestroyNotify destroy_func);


Untrusted*
untrusted_construct (GType object_type)
{
	Untrusted * self = NULL;
#line 24 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	self = (Untrusted*) g_object_new (object_type, "application-id", "com.github.cassidyjames.untrusted", "flags", G_APPLICATION_FLAGS_NONE, NULL);
#line 23 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	return self;
#line 112 "Application.c"
}


Untrusted*
untrusted_new (void)
{
#line 23 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	return untrusted_construct (TYPE_UNTRUSTED);
#line 121 "Application.c"
}


static Block1Data*
block1_data_ref (Block1Data* _data1_)
{
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	g_atomic_int_inc (&_data1_->_ref_count_);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	return _data1_;
#line 132 "Application.c"
}


static void
block1_data_unref (void * _userdata_)
{
	Block1Data* _data1_;
	_data1_ = (Block1Data*) _userdata_;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	if (g_atomic_int_dec_and_test (&_data1_->_ref_count_)) {
#line 143 "Application.c"
		Untrusted* self;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
		self = _data1_->self;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
		_g_object_unref0 (_data1_->window);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
		_g_object_unref0 (self);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
		g_slice_free (Block1Data, _data1_);
#line 153 "Application.c"
	}
}


static void
__lambda6_ (Block1Data* _data1_)
{
	Untrusted* self;
#line 38 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	self = _data1_->self;
#line 39 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	if (_data1_->window != NULL) {
#line 40 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
		gtk_widget_destroy ((GtkWidget*) _data1_->window);
#line 168 "Application.c"
	}
}


static void
___lambda6__g_simple_action_activate (GSimpleAction* _sender,
                                      GVariant* parameter,
                                      gpointer self)
{
#line 38 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	__lambda6_ (self);
#line 180 "Application.c"
}


static void
untrusted_real_activate (GApplication* base)
{
	Untrusted * self;
	Block1Data* _data1_;
	MainWindow* _tmp0_;
	GSimpleAction* quit_action = NULL;
	GSimpleAction* _tmp1_;
	gchar* _tmp2_;
	gchar** _tmp3_;
	gchar** _tmp4_;
	gint _tmp4__length1;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	self = (Untrusted*) base;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_data1_ = g_slice_new0 (Block1Data);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_data1_->_ref_count_ = 1;
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_data1_->self = g_object_ref (self);
#line 29 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp0_ = main_window_new ();
#line 29 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	g_object_ref_sink (_tmp0_);
#line 29 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_data1_->window = _tmp0_;
#line 30 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	gtk_widget_show_all ((GtkWidget*) _data1_->window);
#line 31 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	gtk_application_add_window ((GtkApplication*) self, (GtkWindow*) _data1_->window);
#line 33 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp1_ = g_simple_action_new ("quit", NULL);
#line 33 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	quit_action = _tmp1_;
#line 35 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	g_action_map_add_action ((GActionMap*) self, (GAction*) quit_action);
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp2_ = g_strdup ("Escape");
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp3_ = g_new0 (gchar*, 1 + 1);
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp3_[0] = _tmp2_;
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp4_ = _tmp3_;
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp4__length1 = 1;
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	gtk_application_set_accels_for_action ((GtkApplication*) self, "app.quit", _tmp4_);
#line 36 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp4_ = (_vala_array_free (_tmp4_, _tmp4__length1, (GDestroyNotify) g_free), NULL);
#line 38 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	g_signal_connect_data (quit_action, "activate", (GCallback) ___lambda6__g_simple_action_activate, block1_data_ref (_data1_), (GClosureNotify) block1_data_unref, 0);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_g_object_unref0 (quit_action);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	block1_data_unref (_data1_);
#line 28 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_data1_ = NULL;
#line 242 "Application.c"
}


static gint
untrusted_main (gchar** args,
                int args_length1)
{
	gint result = 0;
	Untrusted* app = NULL;
	Untrusted* _tmp0_;
#line 46 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	gtk_init (&args_length1, &args);
#line 48 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_tmp0_ = untrusted_new ();
#line 48 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	app = _tmp0_;
#line 49 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	result = g_application_run ((GApplication*) app, args_length1, args);
#line 49 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	_g_object_unref0 (app);
#line 49 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	return result;
#line 265 "Application.c"
}


int
main (int argc,
      char ** argv)
{
#line 45 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	return untrusted_main (argv, argc);
#line 275 "Application.c"
}


static void
untrusted_class_init (UntrustedClass * klass)
{
#line 22 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	untrusted_parent_class = g_type_class_peek_parent (klass);
#line 22 "/home/cassidyjames/Projects/cassidyjames/untrusted/src/Application.vala"
	((GApplicationClass *) klass)->activate = (void (*) (GApplication *)) untrusted_real_activate;
#line 286 "Application.c"
}


static void
untrusted_instance_init (Untrusted * self)
{
}


GType
untrusted_get_type (void)
{
	static volatile gsize untrusted_type_id__volatile = 0;
	if (g_once_init_enter (&untrusted_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (UntrustedClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) untrusted_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (Untrusted), 0, (GInstanceInitFunc) untrusted_instance_init, NULL };
		GType untrusted_type_id;
		untrusted_type_id = g_type_register_static (gtk_application_get_type (), "Untrusted", &g_define_type_info, 0);
		g_once_init_leave (&untrusted_type_id__volatile, untrusted_type_id);
	}
	return untrusted_type_id__volatile;
}


static void
_vala_array_destroy (gpointer array,
                     gint array_length,
                     GDestroyNotify destroy_func)
{
	if ((array != NULL) && (destroy_func != NULL)) {
		int i;
		for (i = 0; i < array_length; i = i + 1) {
			if (((gpointer*) array)[i] != NULL) {
				destroy_func (((gpointer*) array)[i]);
			}
		}
	}
}


static void
_vala_array_free (gpointer array,
                  gint array_length,
                  GDestroyNotify destroy_func)
{
	_vala_array_destroy (array, array_length, destroy_func);
	g_free (array);
}




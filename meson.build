project('com.github.cassidyjames.agents', 'vala', 'c')

gnome = import('gnome')

add_global_arguments('-DGETTEXT_PACKAGE="' + meson.project_name() + '"', language:'c')

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Dialogs/BiometricDialog.vala',
    'src/Dialogs/ContentWarningDialog.vala',
    'src/Dialogs/IndicatorDialog.vala',
    'src/Dialogs/UntrustedDialog.vala',
    dependencies: [
        dependency('glib-2.0', version: '>=2.64'),
        dependency('granite', version: '>=6.1'),
        dependency('gtk+-3.0', version: '>=3.24'),
        dependency('libhandy-1', version: '>= 0.90')
    ],
    install: true
)


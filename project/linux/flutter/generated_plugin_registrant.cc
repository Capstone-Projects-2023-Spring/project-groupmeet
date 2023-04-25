//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <rich_clipboard_linux/rich_clipboard_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) rich_clipboard_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RichClipboardPlugin");
  rich_clipboard_plugin_register_with_registrar(rich_clipboard_linux_registrar);
}

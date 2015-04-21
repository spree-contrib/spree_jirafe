Deface::Override.new(:virtual_path => 'spree/admin/shared/_configuration_menu',
  :original => '78964fafd5b82effb0ea3da1b3479c840919b945',
  name: 'add_jirafe_to_sidebar',
  insert_bottom: "[data-hook=admin_configurations_sidebar_menu]",
  text: "<%= configurations_sidebar_menu_item Spree.t(:jirafe_settings), edit_admin_jirafe_settings_path %>"
)

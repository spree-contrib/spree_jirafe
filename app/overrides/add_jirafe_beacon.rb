Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
  :original => 'b5619c4418a841e8d9c641226616c5268ec85f61',
  name: 'add_jirafe_beacon',
  insert_bottom: "body",
  partial: 'spree/shared/jirafe_beacon'
)

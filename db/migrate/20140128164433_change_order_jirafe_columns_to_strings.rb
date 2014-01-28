class ChangeOrderJirafeColumnsToStrings < ActiveRecord::Migration
  def change
    change_column :spree_orders, :visit_id,         :string
    change_column :spree_orders, :visitor_id,       :string
    change_column :spree_orders, :pageview_id,      :string
    change_column :spree_orders, :last_pageview_id, :string
  end
end

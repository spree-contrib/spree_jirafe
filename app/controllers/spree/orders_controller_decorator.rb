Spree::OrdersController.class_eval do
  after_filter :set_jirafe_visit_attributes, only: :populate

  private

  def set_jirafe_visit_attributes
    Spree::Jirafe::OrderUpdater.new(current_order, :populate, cookies).perform!
  end
end

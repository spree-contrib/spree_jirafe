Spree::OrdersController.class_eval do
  after_filter :set_jirafe_visit_attributes, only: :populate

  private

  def set_jirafe_visit_attributes
    @order = current_order
    return unless @order
    @order.visit_id = cookies['jirafe_vis'].to_i || 0
    @order.visitor_id = cookies['jirafe_vid'].to_i || 0

    @order.save
  end
end

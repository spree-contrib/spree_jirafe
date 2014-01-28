Spree::CheckoutController.class_eval do
  before_filter :set_jirafe_visit_attributes, only: :update

  private

  def set_jirafe_visit_attributes
    return unless @order
    @order.visit_id = cookies['jirafe_vis'] || 0
    @order.visitor_id = cookies['jirafe_vid'] || 0
  end
end

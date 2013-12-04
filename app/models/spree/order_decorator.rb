Spree::Order.class_eval do
  before_save :set_jirafe_visit_attributes

  private

  def set_jirafe_visit_attributes
    binding.pry
    self.visit_id = 123
  end
end

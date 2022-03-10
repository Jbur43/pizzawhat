class Order < ApplicationRecord
  TOPPINGS = ["perpperoni", "sausage", "red onion", "banana peppers"]

  before_update :increment_step

  private

  def increment_step
    self.step = step + 1
    binding.pry
  end
end

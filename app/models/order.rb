class Order < ApplicationRecord
  TOPPINGS = ["perpperoni", "sausage", "red onion", "banana peppers", "anchovies"]
  EXTRAS = ["extra cheese", "brownie", "breadsticks"]

  broadcasts_to ->(todo) { "orders" }, inserts_by: :prepend, target: "orders"

  before_update :increment_step

  private

  def increment_step
    return if step == 4

    self.step = step + 1
  end
end

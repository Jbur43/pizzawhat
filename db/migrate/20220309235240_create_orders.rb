class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.boolean :delivery, default: false
      t.json :toppings, array: true, default: []
      t.json :extras, array: true, default: []
      t.integer :step, default: 1

      t.timestamps
    end
  end
end

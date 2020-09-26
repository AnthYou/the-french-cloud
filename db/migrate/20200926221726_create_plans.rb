class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :sku
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

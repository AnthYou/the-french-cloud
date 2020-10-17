class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :sku
      t.string :title
      t.string :level

      t.timestamps
    end
  end
end

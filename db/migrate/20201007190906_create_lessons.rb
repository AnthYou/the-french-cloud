class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :sku
      t.string :level
      t.text :description_fr
      t.text :description_en

      t.timestamps
    end
  end
end

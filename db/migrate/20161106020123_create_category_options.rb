class CreateCategoryOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_options do |t|
      t.string :text
      t.string :description
      t.string :type
      t.string :icon
      t.integer :index
      t.references :category, foreign_key: true
    end
  end
end

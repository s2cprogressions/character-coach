class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title

      t.text :challenges
      t.text :thinking
      t.text :feelings
      t.text :concerns
      t.text :positive_thoughts
      t.text :positive_behaviors

      t.timestamps
    end
  end
end

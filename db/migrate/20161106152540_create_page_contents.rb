class CreatePageContents < ActiveRecord::Migration[5.0]
  def change
    create_table :page_contents do |t|
      t.string :text
      t.string :type, null: false
      t.string :key, null: false, unique: true

      t.timestamps
    end
    add_index :page_contents, :key
  end
end

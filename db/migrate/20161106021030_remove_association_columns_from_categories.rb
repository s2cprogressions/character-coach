class RemoveAssociationColumnsFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :challenges
    remove_column :categories, :thinking
    remove_column :categories, :feelings
    remove_column :categories, :concerns
    remove_column :categories, :positive_thoughts
    remove_column :categories, :positive_behaviors
  end
end

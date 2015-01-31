class AddIndexToItemsTags < ActiveRecord::Migration
  def change
    add_index :items, :tags
  end
end
class AddColumnTagsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :tags, :text
  end

  def self.down
    remove_column :items, :tags, :text
  end
end
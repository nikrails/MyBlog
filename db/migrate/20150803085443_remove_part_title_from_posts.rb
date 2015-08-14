class RemovePartTitleFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :part_title, :string
  end
end

class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :part_title, :string
  end
end

class TranslatePost < ActiveRecord::Migration
  def change
    Post.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end
end

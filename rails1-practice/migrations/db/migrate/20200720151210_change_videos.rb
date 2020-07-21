class ChangeVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :name, :title
    add_foreign_key :videos, :users, column: "uploader_id"
    add_index :videos, :uploader_id
    #Ex:- add_index("admin_users", "username")
  end
end

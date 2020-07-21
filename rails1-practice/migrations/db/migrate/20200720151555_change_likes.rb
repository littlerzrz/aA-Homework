class ChangeLikes < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key :likes, :users, column: "liker_id"
      add_foreign_key :likes, :videos, column: "video_id"
  end
end

class ChangeColName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :user_id, :commenter_id
    rename_column :comments, :comment_id, :parent_comment_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword") :comments, :user_id, :commenter_id
  end
end

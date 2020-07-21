class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :email, :username
    remove_column :users, :bio
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

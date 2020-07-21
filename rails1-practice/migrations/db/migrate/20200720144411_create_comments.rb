class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body,null:false
      t.references :video, foreign_key: true, null:false
      t.references :user, foreign_key: true, null:false
      t.references :comment, foreign_key:true

      t.timestamps
    end
  end
end

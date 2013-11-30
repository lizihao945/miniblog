class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :count
      t.references :post
      t.references :user
    end
    add_index :likes, :post_id
    add_index :likes, :user_id
  end
end

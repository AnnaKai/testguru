class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :user_id
    add_index :tests, %i[title level], unique: true
    add_index :users, %i[first_name last_name]
    add_index :users, :email
  end
end

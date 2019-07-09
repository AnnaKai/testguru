class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :users
  end
end

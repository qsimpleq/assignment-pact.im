class RemoveUserIdFromInterests < ActiveRecord::Migration[7.2]
  def change
    remove_column :interests, :user_id
    add_column :interests, :name, :string, null: false
    add_index :interests, :name, unique: true
  end
end

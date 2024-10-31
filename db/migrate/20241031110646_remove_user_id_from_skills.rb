class RemoveUserIdFromSkills < ActiveRecord::Migration[7.2]
  def change
    remove_column :skills, :user_id
    add_column :skills, :name, :string, null: false
    add_index :skills, :name, unique: true
  end
end

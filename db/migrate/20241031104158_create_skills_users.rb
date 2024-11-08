class CreateSkillsUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :skills_users, id: false do |t|
      t.timestamps
      t.belongs_to :skill
      t.belongs_to :user
      t.index [ :skill_id, :user_id ], unique: true
    end
  end
end

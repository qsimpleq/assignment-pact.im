class CreateInterestsUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :interests_users, id: false do |t|
      t.timestamps
      t.belongs_to :interest
      t.belongs_to :user
      t.index [ :interest_id, :user_id ], unique: true
    end
  end
end

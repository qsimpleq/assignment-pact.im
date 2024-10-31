class AddAgeCountryEmailGenderNationalityPatronymicSurnameToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :country, :string
    add_column :users, :email, :string
    add_column :users, :gender, :string
    add_column :users, :nationality, :string
    add_column :users, :patronymic, :string
    add_column :users, :surname, :string
  end
end

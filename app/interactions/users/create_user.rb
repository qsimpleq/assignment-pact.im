class CreateUser < ActiveInteraction::Base
  hash :params do
    integer :age
    string :country
    string :email
    string :gender
    string :name
    string :nationality
    string :patronymic
    string :surname
    array :interests, default: []
    array :skills, default: []
  end

  def execute
    user_params = params.except(:interests, :skills)
    user = User.create(user_params)

    if user.save
      params[:interests].each do |interest_name|
        interest = Interest.find_or_create_by(name: interest_name)
        user.interests << interest if interest
      end

      params[:skills].each do |skill_name|
        skill = Skill.find_or_create_by(name: skill_name)
        user.skills << skill if skill
      end
    end

    user
  end
end

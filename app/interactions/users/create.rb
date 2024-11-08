class Users::Create < ActiveInteraction::Base
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
    user_full_name = "#{params['surname']} #{params['name']} #{params['patronymic']}"
    user_params = params.except(:interests)
    user = User.create(user_params.merge(user_full_name))

    Interest.where(name: params["interests"]).each do |interest|
      user.interests = user.interest + interest
      user.save!
    end

    user_skills = []
    params["skills"].split(",").each do |skill|
      skill = Skill.find(name: skill)
      user_skills = user_skills + [ skill ]
    end
    user.skills = user_skills
    user.save
  end
end

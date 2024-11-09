class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = CreateUser.run(params: permitted_params)

    if user&.result&.persisted?
      render json: user.result, status: :created
    else
      render json: user.errors.any? ? user.errors : user.result.errors, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.permit(
      :age,
      :country,
      :email,
      :gender,
      :name,
      :nationality,
      :patronymic,
      :surname,
      interests: [],
      skills: []
    )
  end
end

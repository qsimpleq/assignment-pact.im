class User < ApplicationRecord
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills

  validates :age, :country, :email, :gender, :name, :nationality, :patronymic, :surname, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 90 }
  validates :gender, inclusion: { in: %w[male female] }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def user_full_name = "#{surname} #{name} #{patronymic}"
end

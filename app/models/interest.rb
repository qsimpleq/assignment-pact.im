class Interest < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 1 }
end

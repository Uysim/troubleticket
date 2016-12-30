class Client < ApplicationRecord
  has_many :troubles, dependent: :destroy

  validates :name,      presence: true
  validates :id_number, presence: true
  validates :phone,     presence: true
  validates :email,     presence: true
  validates :address,   presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

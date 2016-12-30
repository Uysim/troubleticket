class Client < ApplicationRecord
  has_many :troubles, dependent: :destroy

  validates :name,      presence: true
  validates :id_number, presence: true, uniqueness: true
  validates :email,     presence: true

  scope :id_number_like, -> (id_number) { where('clients.id_number iLike :id_number', id_number: "#{id_number}") }
  scope :phone_like, -> (phone) { where('clients.phone iLike :phone', phone: "#{phone}") }
  scope :email_like, -> (email) { where('clients.email iLike :email', email: "#{email}") }
  scope :name_like, ->(name){ where('clients.name iLike :name', name: "%#{name}%") }

end

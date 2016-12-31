class Client < ApplicationRecord
  has_many :troubles, dependent: :destroy

  validates :name,      presence: true
  validates :id_number, presence: true, uniqueness: true
  validates :email,     presence: true

  after_initialize :generate_id_number, if: :new_record?

  scope :with_id_number, -> (id_number) { where(id_number: id_number) }
  scope :with_phone, -> (phone) { where(phone: phone) }
  scope :with_email, -> (email) { where(email: email) }
  scope :name_like, ->(name){ where('clients.name iLike :name', name: "%#{name}%") }

  private

  def generate_id_number
    self.id_number = "client-#{Client.count+1}"
  end
end

class Trouble < ApplicationRecord
  belongs_to :client
  belongs_to :user

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :client, prefix: true, allow_nil: true

  def self.filter_with_user_email(email)
    joins(:user).where('users.email iLike :email', email: "%#{email}")
  end

  def self.filter_with_client_name(name)
    joins(:client).where('clients.name iLike :name', name: "%#{name}")
  end
end

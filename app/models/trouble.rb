class Trouble < ApplicationRecord
  include AASM

  belongs_to :client
  belongs_to :user, optional: true

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :client, prefix: true, allow_nil: true

  aasm do
    state :open, initial: true
    state :assigned
    state :working
    state :closed

    event :assign do
      transitions :from => :open, :to => :assigned, :guard => ->{ user.present? }
    end

    event :work do
      transitions :from => :assigned, :to => :working
    end

    event :close do
      transitions :from => :working, :to => :closed
    end
  end

  def self.filter_with_user_email(email)
    joins(:user).where('users.email iLike :email', email: "%#{email}")
  end

  def self.filter_with_client_name(name)
    joins(:client).where('clients.name iLike :name', name: "%#{name}")
  end
end

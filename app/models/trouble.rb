class Trouble < ApplicationRecord
  include AASM

  attr_accessor :client_id_number

  belongs_to :client
  belongs_to :user, optional: true

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :client, prefix: true, allow_nil: true

  validates :range,       presence: true
  validates :detail,      presence: true

  after_validation :bind_client_id_number_errors_with_client, if: ->{ errors[:client].present? }

  RANGE = ['Internet Speed', 'Connection Stability', 'No Link', 'Others']

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

  private

  def bind_client_id_number_errors_with_client
    errors[:client].each do |error|
      self.errors.add :client_id_number, error
    end
  end
end

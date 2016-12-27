class Trouble < ApplicationRecord
  belongs_to :client
  belongs_to :user

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :client, prefix: true, allow_nil: true
end

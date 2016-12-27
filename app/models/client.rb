class Client < ApplicationRecord
  has_many :troubles, dependent: :destroy
end

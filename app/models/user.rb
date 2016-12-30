class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :troubles, dependent: :restrict_with_error

   validates :role, presence: true

   scope :support, ->{ where(role: 'support') }
   scope :email_like, -> (email){ where('users.email = :email', email: "#{email}") }

   ROLE = ['admin', 'support']

   ROLE.each do |user_role|
     define_method "#{user_role}?" do
       role == user_role
     end
   end
end

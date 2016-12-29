class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :troubles, dependent: :restrict_with_error

   validates :role, presence: true
   ROLE = ['admin', 'support']

   ROLE.each do |user_role|
     define_method "#{user_role}?" do
       role == user_role
     end
   end

   def self.filter_by_role(role)
     self.where('role iLike :role', role: "#{role}")
   end
end

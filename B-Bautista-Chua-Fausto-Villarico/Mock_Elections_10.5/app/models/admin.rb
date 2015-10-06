class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, presence: true
         validates :email, uniqueness: true
         validates :gender, presence: true
         validates :birthday, presence: true

end

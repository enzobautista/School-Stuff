class Position < ActiveRecord::Base
  has_many :candidates

  validates :name, presence: true
  validates :name, uniqueness: true
end

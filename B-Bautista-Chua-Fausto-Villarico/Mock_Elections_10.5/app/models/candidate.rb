class Candidate < ActiveRecord::Base
  has_many :votes
  belongs_to :position
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :slogan, presence: true
  validates :slogan, uniqueness: true

end

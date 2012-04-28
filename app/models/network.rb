class Network < ActiveRecord::Base

  has_and_belongs_to_many :users
  attr_accessible :description, :title

  validates :title, presence: true, uniqueness: true

end

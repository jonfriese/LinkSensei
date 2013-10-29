class Container < ActiveRecord::Base
  has_many :links
  belongs_to :user
  validates :name, presence: true
  validates_uniqueness_of :name
end

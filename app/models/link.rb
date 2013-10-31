class Link < ActiveRecord::Base
  belongs_to :container
  validates :url, presence: true
  validates :name, presence: true
  validates :description, length: { in: 0..140 }
end

class Link < ActiveRecord::Base
  belongs_to :container
  validates :url, presence: true
end

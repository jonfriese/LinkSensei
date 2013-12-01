class Link < ActiveRecord::Base
  belongs_to :container
  validates :url, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, length: { in: 0..140 }
  validate :public_suffix

  def public_suffix
    if PublicSuffix.valid?(self.url) != true
      self.errors.add(:url, "URL must have a public suffix")
    end
  end
end

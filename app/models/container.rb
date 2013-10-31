class Container < ActiveRecord::Base
  has_many :links
  belongs_to :creator, class_name: "User"
  validates :name, presence: true

  def staging?
    name == "Staging"
  end

  def created_by?(user)
    creator == user
  end
end

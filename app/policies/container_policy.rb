class ContainerPolicy
  attr_reader :user, :container

  def initialize(user, container)
    @user = user
    @container = container
  end

  def destroy?
    container.created_by?(user) if user.present?
  end

  def update?
    container.created_by?(user) if user.present?
  end
end

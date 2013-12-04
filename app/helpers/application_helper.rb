module ApplicationHelper
  def resource_name
    :user
  end

  def resource_class
    devise_mapping.to
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def on_my_page?
    page_id = request.path.split('/')[2]
    page_id.to_s == current_user.id.to_s
  end

  def on_private_page?
    (@user != current_user) && (@user.public_status != true)
  end
end

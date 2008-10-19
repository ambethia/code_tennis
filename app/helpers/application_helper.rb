# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => key, :id => "flash") unless flash[key].blank?
    end.join
  end

  def display_user_avatar(user)
    user.avatar.nil? ? '' : image_tag(user.avatar.filename,:alt => user.display_name, :class => 'avatar', :size => '175x175')
  end

end

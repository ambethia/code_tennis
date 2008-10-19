# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => key, :id => "flash") unless flash[key].blank?
    end.join
  end

  def display_user_avatar(user, size = :large)
    user.avatar.nil? ? '' : avatar_image_tag(user.avatar, user.display_name, size)
  end
  
  def avatar_image_tag(avatar,alt, size = :large)
    unless avatar.nil?
       ext  = File.extname(avatar.filename)
       name = File.basename(avatar.filename, ext) 
       filename = "#{name}_#{size.to_s}#{ext}"
       sizes = {:small => "50x50", :medium => "100x100", :large => "175x175"}
       image_tag(filename,:alt => alt, :class => 'avatar', :size => sizes[size])
    end
  end

end

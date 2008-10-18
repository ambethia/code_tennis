# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => key, :id => "flash") unless flash[key].blank?
    end.join
  end

end

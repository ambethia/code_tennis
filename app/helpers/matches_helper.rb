module MatchesHelper
  
  def commit_messages(volley)
    html = ''
    volley.commits.each do |commit|
      html << commit.message << "  --  " << commit.created_at.strftime("%b %d %H:%M") <<  "<br />"
      html << image_tag(volley.player.avatar.filename) if volley.player.avatar
    end
    html
  end
end

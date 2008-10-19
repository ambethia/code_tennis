module MatchesHelper
  
  def commit_messages(volley)
    html = ''
    volley.commits.each do |commit|
      html << commit.message << "  --  " << commit.created_at.strftime("%b %d %H:%M") 
      html << ' by ' << commit.player.nickname <<  "<br />"
      html << display_user_avatar(volley.player, :small) if volley.player.avatar
    end
    html
  end
end

#Sample Json update from github:

#{ 
#  :before     => before,
#  :after      => after,
#  :ref        => ref,
#  :commits    => [{ 
#    :id        => commit.id,
#    :message   => commit.message,
#    :timestamp => commit.committed_date.xmlschema,
#    :url       => commit_url,
#    :added     => array_of_added_paths,
#    :removed   => array_of_removed_paths,
#    :modified  => array_of_modified_paths,    
#    :author    => {
#      :name  => commit.author.name,
#      :email => commit.author.email
#    }
#  }],
#  :repository => {
#    :name        => repository.name,
#    :url         => repo_url, 
#    :pledgie     => repository.pledgie.id
#    :description => repository.description,
#    :homepage    => repository.homepage,
#    :watchers    => repository.watchers.size,
#    :forks       => repository.forks.size,
#    :private     => repository.private?,   
#    :owner => {
#      :name  => repository.owner.login,
#      :email => repository.owner.email
#    }
#  }
#}


class UpdatesController < ApplicationController
  def index
    github_response = JSON.parse(params[:payload])
    message = github_response[:commits][:message]
    user = User.find_by_email(github_response[:commits][:author][:email])
    match = Match.find_by_github_project(github_response[:repository][:name])
    if message =~ /.*volley.*/
      #end of a volley
    else
      #normal commit
    end
  end
  
end

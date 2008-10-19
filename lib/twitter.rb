class Twitter
  require 'net/http'
  require 'uri'

  # code from http://journal.mychores.co.uk/articles/2007/01/21/updating-twitter-from-ruby-rails
  def Twitter.update(message)
    twitter_config = YAML.load(File.open("#{RAILS_ROOT}/config/twitter.yml"))
    twitter_user = twitter_config["twitter_user"]
    twitter_pwd  = twitter_config["twitter_pwd"]
    RAILS_DEFAULT_LOGGER.debug("*** twitter update #{message}")
    success = false
    if ENV['RAILS_ENV'] == 'production'
      begin
          url = URI.parse('http://twitter.com/statuses/update.xml')
          req = Net::HTTP::Post.new(url.path)
          req.basic_auth twitter_user,twitter_pwd
          req.set_form_data({'status' => message})

          begin
              res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }

              case res
              when Net::HTTPSuccess, Net::HTTPRedirection
                  if res.body.empty?
                    RAILS_DEFAULT_LOGGER.info("twitter failure 1")
                      # Twitter is not responding properly
                  else
                      # Twitter update succeeded
                      success = true
                  end

              else
                  # Twitter update failed for an unknown reason
                  RAILS_DEFAULT_LOGGER.info("twitter failure 2")
                  res.error!
              end

          rescue
              # Twitter update failed - check username/password
              RAILS_DEFAULT_LOGGER.info("twitter failure 3")
          end

      rescue SocketError
          # Twitter is currently unavailable
          RAILS_DEFAULT_LOGGER.info("twitter failure 4")
      end
    end # end if ENV['RAILS_ENV'] == 'production'
    success
  end
  
end
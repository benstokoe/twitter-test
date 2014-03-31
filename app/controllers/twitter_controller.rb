class TwitterController < ApplicationController
  def index
    access_token = prepare_access_token(ENV['API_KEY'], ENV['API_SECRET'])
    response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=skynews")
    @tweets = JSON.parse(response.body, :symbolize_names => true)
  end

  private

  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new(ENV['OAUTH_TOKEN'], ENV['OAUTH_TOKEN_SECRET'],
      { :site => "https://api.twitter.com",
        :scheme => :header
      })
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret
                 }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end
end

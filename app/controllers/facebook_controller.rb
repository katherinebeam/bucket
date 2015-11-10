class FacebookController < ApplicationController
  def token
    render plain: params.to_json
  end
end

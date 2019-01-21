class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  ## this is here because its called by the email confirmations controller and the dashboard view
  ## This should be refactored in a more sensible way
  def generate_api_key(user=nil)
    user ||= current_user
    api_key = ApiKey.new do |a|
      a.key = ApiKey.generator
      a.user = user
    end
    if api_key.save! 
      if current_user
        render template: "dashboards/show"
      else
        return
      end
    end
  end
end

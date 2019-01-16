class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def generate_api_key(user)
    api_key = ApiKey.new
    api_key.key = ApiKey.generator
    api_key.user = user || current_user
    current_user.api_key = api_key
    current_user.save!
    api_key.save!
    render template: "dashboards/show"
  end
end

class Api::ApiController < ApplicationController
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing_response
  #rescue_from ActiveRecord::RecordInvalid with: :render_record_invalid_response

  def render_parameter_missing_response(exception)
    render json: {error: exception.message}, status: 422
  end

  def render_record_invalid_response(exception)
    render json: {error: exception.message}, status: 422
  end

end

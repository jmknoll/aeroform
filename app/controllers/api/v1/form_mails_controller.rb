class Api::V1::FormMailsController < Api::ApiController

  skip_before_action :verify_authenticity_token, :only => [:create]
  
  def create

    @user =  User.joins(:api_key).find_by(api_keys: {key: params[:api_key]})
    if !@user
      render json: {message: "User not found. Please check that your API key is valid."}, status: 401
    end

    @form_mail = FormMail.new(form_mail_params)
    @form_mail.user = @user
    if @form_mail.save
      send_form_email(params[:data])
      #render json: {message: "Message sent succesfully"}, status: 200
    else
      render json: {errors: @form_mail.errors.full_messages}, status: 422
    end

  end

  private

  def form_mail_params
    params.require(:data).permit(:body, :recipient)
  end

  def send_form_email(data)
    FormMailer.form_email(data).deliver_now
  end

end

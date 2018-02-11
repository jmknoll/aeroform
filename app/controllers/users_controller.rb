class UsersController < Clearance::UsersController
  
  def new
    @user = User.new
    render template: "users/new"
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = user_from_params
    @user.email_confirmation_token = Clearance::Token.new

    if @user.save
      UserMailer.registration_confirmation(@user).deliver_later
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def generate_api_key
    api_key = ApiKey.new
    api_key.key = ApiKey.generator
    api_key.user = current_user
    current_user.api_key = api_key
    current_user.save!
    api_key.save!
    render template: "dashboards/show"
  end

  def resend_email_confirmation_form
  end

  def resend_email_confirmation
    @user = User.find_by(email: params[:user][:email])
    UserMailer.registration_confirmation(@user).deliver_later
  end

  private

  def url_after_create
    email_confirmation_path
  end

end

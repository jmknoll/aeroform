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

  def resend_email_confirmation_form
  end

  def resend_email_confirmation
    print('running the resend email confirmation method')
    print(params)
    @user = User.find_by(email: params[:user][:email])
    print(@user)
    UserMailer.registration_confirmation(@user).deliver_later
  end

  private

  def url_after_create
    email_confirmation_path
  end

end

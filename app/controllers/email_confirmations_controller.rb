class EmailConfirmationsController < ApplicationController

  def update
    user = User.find_by!(email_confirmation_token: params[:token])
    user.confirm_email
    generate_api_key(user)
    sign_in user
    redirect_to root_path, notice: t("flashes.confirmed_email")
  end

end

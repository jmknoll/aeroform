class UsersController < Clearance::UsersController
  
  def new
    @user = User.new
    render template: "users/new"
  end

  def show
    @user = User.find(params[:id])
  end

end

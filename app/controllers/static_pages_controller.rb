class StaticPagesController < ApplicationController
  
  def home
  end

  def about
  end

  def email_confirmation
    @user = current_user
  end

  def docs
    
  end
  
end

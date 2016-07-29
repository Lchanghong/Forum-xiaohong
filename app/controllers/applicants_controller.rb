class ApplicantsController < ApplicationController

skip_before_action :check_login
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if@user.save
      #调到登录界面
  		redirect_to new_session_url
  	else
  		render  'new'
  	end
  end
  private


  def user_params
  	params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

class SessionsController < ApplicationController
  skip_before_action :check_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
  	user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
  	if user
      flash[:notice] = "我在传值"
      session[:user_id] = user.id
      
  		redirect_to :posts
  	else
  		flash.now[:login_error] = "用户名或密码错误!"
   render "new"
  end
 end
 def show
  if session[:user_id]
  @user = User.find_by(id: session[:user_id])
  else
    redirect_to :sessions_new
  end
  end

 def destroy
  session[:user_id] = nil
  redirect_to :root
 end

 private
  def user_params
   params.require(:session).permit(:name, :password)
  end 
end

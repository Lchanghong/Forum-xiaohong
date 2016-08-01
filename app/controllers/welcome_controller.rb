class WelcomeController < ApplicationController
  skip_before_action :check_login
  def index
  	$visitor +=1
  end
end

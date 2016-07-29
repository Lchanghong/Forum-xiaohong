class User < ActiveRecord::Base

validates_presence_of :password, :message =>"密码不能为空!" 
validates_presence_of :name,  :message =>"账号不能为空!" 

	has_many :comments, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_secure_password
end

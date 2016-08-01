class PostsController < ApplicationController
	skip_before_action :check_login, only: [:show, :index]

	def new
	@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = session[:user_id]
	   if @post.save
		 redirect_to @post
	   else
		 render 'new'
	    end
	end

	def show
		@post = Post.find (params[:id])
		#内嵌套可以带参数

		#render :inline=>"<h2>测试内嵌套view模块1</h2><%= @post.title %>"
	end
	def index
		$visitor +=1
		@posts = Post.all 
		#render :action =>"自定义view模块"
		#render :action=>"test" 
		#layout false 不适用自动布局,true 使用自动布局,默认是使用的
		#render :action=>"test" #, :layout=>false 
		#_viewname局部view模块

		
   # 
	#	render :inline=>"<h2>测试内嵌套view模块1</h2><% @posts.each do |post| %>

 # <tr>
   #   <div><%= post.title %></div>
    #  <br>
   #   <div><%= post.text %></div>"
	#
	
	end
	def edit
		@post = Post.find (params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
           redirect_to @post
        else
           render 'edit'
        end
    end
    def destroy
    	@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_path
    end

	private
	def post_params
		params.require(:post).permit(:title,:text)
	end

end

class PostsController < ApplicationController
	skip_before_action :check_login, only: [:show, :index]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		@post.user_id = session[:user_id]
		respond_to do |format|
	   		if @post.save
	   	 		format.html { render :apost, status: :created , location: @post, layout: false }
			else
       			format.html { render :new }
				format.json{ render json: @user.errors, status: :unprocessable_entity }
	        end
	        format.json
	    end


	end

	def apost
	end

	def show
	end

	def index
		$visitor +=1
		 @posts = Post.order('id DESC')  #倒序
		# @posts = Post.order('id').last()
		@post = Post.new
		#render :action =>"自定义view模块"
		#render :action=>"test" 
		#layout false 不使用自动布局,true 使用自动布局,默认是使用的
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
	   respond_to do |format|
         format.html
         format.json { render json: @post, status: :ok, location: @post }
       end
	end

	def update

	  respond_to do |format|
        format.html
        format.json { render json: @post, status: :ok, location: @post }
      end
		# @post = Post.find(params[:id])
		# if @post.update(post_params)
  #          # redirect_to @post
  #       else
  #          render 'edit'
  #       end
    end
    def destroy
    	 @post = Post.find(params[:id])
    	 @post.destroy
         respond_to do |format|
           format.html { redirect_to posts_path, notice: '删除成功!' }
           format.json { head :no_content }
           format.js


    	 # @post = Post.find(params[:id])
    	 # @post.destroy
    	 # redirect_to posts_path
    	  end
    end

	private
     def  set_post
     	# 一次设置即可,所有action都可以使用
     	@post = Post.find(params[:id])
     end

	def post_params
		params.require(:post).permit(:title,:text)
	end

end

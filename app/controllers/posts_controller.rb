class PostsController < ApplicationController
	skip_before_action :check_login, only: [:show, :index]
	before_action :set_post,only: [:show, :edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		@post.user_id = session[:user_id]
		respond_to do |format|
	   		if @post.save
	   	 		# format.html { render :apost, status: :created , location: @post, layout: false }
	   	 		# format.js
			else
         		
    	        #format.html { render :new }
				
				# format.json{ render json: @user.errors, status: :unprocessable_entity }
	        end
	        format.js
	    end


	end

	def apost
	end

	def show
	end

	def index
		$visitor +=1
		 @posts = Post.order('id DESC')  #倒序
	
		 @post = Post.new

	
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
		
    end
    def destroy
    	 @post.destroy
          respond_to do |format|
            format.html { redirect_to posts_url, notice: '删除成功!' }
            format.json { head :no_content }
             format.js
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

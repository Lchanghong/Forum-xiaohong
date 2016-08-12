class CommentsController < ApplicationController
  before_action :set_post ,only: [:create, :destroy]

	def create
      sleep 1  #模拟网络延时1秒
    
      @comment = @post.comments.create(comment_params)
      @comment.user_id = session[:user_id]
      
      respond_to do |format|
          @comment.save
          # format.html { render :acomment, status: :created , location: @post, layout: false }
          format.js
      end
      # redirect_to post_path(@post)
  end

  def destroy
  	  @comment = @post.comments.find(params[:id])
  	  @comment.destroy
      respond_to do |format|

        format.js
      end
  	  # redirect_to post_path(@post)
  end
 
  private
  def set_post
      @post = Post.find(params[:post_id])
    end

  def comment_params
        params.require(:comment).permit(:content)
    end
end

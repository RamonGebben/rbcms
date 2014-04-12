class FrontendController < ApplicationController
  def home
      @posts = Post.order('created_at DESC')
      Pageview.create( :user_ip => request.remote_ip )
  end
  
  def post
      @post = Post.find(params[:id])
      Pageview.create( :post_id => @post.id, :user_ip => request.remote_ip )
  end
  
end

class FrontendController < ApplicationController
  def home
      @recent = Post.order('created_at DESC').limit( 3 )
      @popular = Pageview.top5_posts
      @posts = Post.where('static IS NULL').order('created_at DESC')
      @sticky = Post.where('static IS NULL').where(:sticky => true).order('updated_at DESC')    
      Pageview.create( :user_ip => request.remote_ip )
  end
  
  def post
      @post = Post.find(params[:id])
      Pageview.create( :post_id => @post.id, :user_ip => request.remote_ip )
  end

  def page
     @post = Post.static_page( params[:name] )
     unless @post then
       redirect_to "/" 
     else
       Pageview.create( :post_id => @post.id, :user_ip => request.remote_ip )
     end
  end
  
end

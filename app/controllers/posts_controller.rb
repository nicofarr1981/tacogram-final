class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json do
        render :json => @posts
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    if @current_user
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post["user_id"] = @current_user["id"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/posts"
  end

  def edit
    @post = Post.find_by({ "id" => params["id"] })
  end

  def update
    @post = Post.find_by({ "id" => params["id"] })
    @post["body"] = params["post"]["body"]
    @post.save
    redirect_to "/posts"
  end

  def destroy
    if @current_user
      @post = Post.find_by({ "id" => params["id"] })
      @post.destroy
      redirect_to "/posts"
    end
  end

  # before_action :allow_cors
  # def allow_cors
  #   response.headers['Access-Control-Allow-Origin'] = '*'
  #   response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  #   response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
  #   response.headers['Access-Control-Max-Age'] = '1728000'
  # end

end
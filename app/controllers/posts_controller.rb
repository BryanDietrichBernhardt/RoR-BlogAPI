class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET /posts
  def index
    @posts = Post.all()
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @posts }
    end
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # GET /posts/:id
  def show
    render json: @post
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

    def post_params
      params.require(:post).permit(:title, :description)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def render_not_found(exception)
      render json: { error: exception.message }, status: :not_found
    end

end

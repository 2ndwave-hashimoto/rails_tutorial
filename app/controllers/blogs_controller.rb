class BlogsController < ApplicationController
  protect_from_forgery :except => [:destroy]
  def index
    @blogs = Blog.search_blogs(params[:keyword]) if params[:keyword].present?
    @blogs = Blog.data_narrow_down(params[:from], params[:to]).recent if params[:from].present? || params[:to].present?
    @blogs = Blog.all.recent if @blogs.nil?
    @pagy, @blogs = pagy(@blogs)
    
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
        redirect_to action: :show, id: @blog.id
        flash[:success] = "記事の登録に成功しました"
    else
        flash[:danger] = "記事の登録に失敗しました"
        render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = Comment.where(blog_id: params[:id])
    @comment = @blog.comments.build
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
        flash[:success] = "記事の更新に成功しました"
        redirect_to action: :show, id: @blog.id
    else
        flash[danger] = "記事の更新に失敗しました"
        render :edit
    end
  end

  def destroy
   @blog = Blog.find(params[:id])
   @blog.destroy
   redirect_to blogs_path
  end

private
  def blog_params
    params.require(:blog).permit(:id,:title,:content)
  end
  def blog_search_params
    params.fetch(:search,{}).permit(:title, :create_at_from, :created_at_to)
  end

end
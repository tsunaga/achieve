class BlogsController < ApplicationController
  
   before_action :set_blog, only: [:edit, :update, :destroy]

  
  def index
   @blogs = Blog.all
   #binding.pry
  end
  
  def new
   if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
      #binding.pry
    end
  end
  
  def create
    @blog=Blog.create(blogs_params)
    
       if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      #redirect_to blogs_path, notice: "ブログを作成しました！"
      @blogs = Blog.all
      render 'index'
      
    else
      # 入力フォームを再描画します。
      render action: 'new'
    end
  end
  
    def edit
   
  end
  
    def update

    @blog.update(blogs_params)
    
       redirect_to blogs_path, notice: "ブログを更新しました！"
  end
  
  
    def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?

    end      
  
    def destroy
  
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  
   private
    def blogs_params
      params.require(:blog).permit(:title, :content)
      #binding.pry
    end
    
     # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
end

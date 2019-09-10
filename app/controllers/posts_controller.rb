class PostsController < ApplicationController
  
  # @postに投稿の情報を入れることで、@postを使ってビューに投稿のキャプションや写真を表示させる

  # ログイン済ユーザーのみにアクセスを許可する
  # 参考資料：https://qiita.com/tobita0000/items/866de191635e6d74e392
  before_action :authenticate_user!

  # buildメソッドについて
  # https://qiita.com/tsuchinoko_run/items/d671ea840bc0bfa90186
  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    # present?はnilまたは空のオブジェクトでなければtrueを返す
    if @post.photos.present?
      # オブジェクトが空じゃない場合
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      # オブジェクトが空である場合
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

end

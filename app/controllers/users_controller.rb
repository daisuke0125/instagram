class UsersController < ApplicationController
  
  # @があるとインスタンス変数になる
  # インスタンス変数を使うことで、コントローラーからビューへ変数を渡すことができる
  
  # マイページ
  def show
    @user = User.find(params[:id])
  end
end

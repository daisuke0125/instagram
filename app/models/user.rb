class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # dependent: :destroy => ユーザーが削除されたら、そのユーザーに紐づく投稿も削除できる
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20}

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end


# 参考記事：パスワード入力なしでプロフィール編集できるようにする
# https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-account-without-providing-a-password
# https://easyramble.com/user-account-update-without-password-on-devise.html

# params.delete(:current_password) で current_password のパラメータを削除
# if params[:password].blank? && params[:password_confirmation].blank? の行で
# パスワード変更のためのパスワード入力フィールドとその確認フィールドの両者とも空の場合のみ、パスワードなしで更新できるようにする
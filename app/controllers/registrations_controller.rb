class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end

# 参考記事：パスワード入力なしでプロフィール編集できるようにする
# https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-account-without-providing-a-password


# 参考記事：after_update_path_for => プロフィールを変更後のパス先を指定できるメソッド
# https://easyramble.com/redirect-account-setting-with-devise.html
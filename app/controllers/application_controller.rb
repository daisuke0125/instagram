class ApplicationController < ActionController::Base

  # (CSRF)への対応策のコード
  protect_from_forgery with: :exception
  # configure_permitted_parametersというメソッドを、
  # devise_controllerを使うときしか処理しないようにさせる
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end

# 参考資料
# https://github.com/plataformatec/devise#strong-parameters

# devise_parameter_sanitizer.permit(
#   追加したいメソッドの種類, keys: [追加したいパラメーター名]
#   )

# devise_parameter_sanitizer.permit(
#   追加したいメソッドの種類, keys: [:パラメーター1, :パラメーター2,..]
#   )


# :sign_up	新規登録時
# :sign_in	ログイン時
# :account_update	レコードの更新時
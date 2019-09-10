module ApplicationHelper

  # profile_photoカラムに何もないときはデフォルトのアイコンを表示
  def avatar_url(user)
    # user.profile_photoカラムがnilでなければ、user.profile_photoを返す
    return user.profile_photo unless user.profile_photo.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end

end

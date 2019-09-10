class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # user_idとpost_idの紐付けが重複していないことを検証
  # 参照記事：https://qiita.com/wadako111/items/958dded40a840c35c5ec
  validates :user_id, uniqueness: { scope: :post_id }
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  default_scope -> { includes(:user).order(created_at: :desc) }
  # https://techracho.bpsinc.jp/hachi8833/2017_10_31/47302
end

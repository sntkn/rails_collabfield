class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  default_scope -> { includes(:user).order(created_at: :desc) }
  # https://techracho.bpsinc.jp/hachi8833/2017_10_31/47302
  scope :by_category, lambda { |branch, category_name|
    joins(:category).where(categories: { name: category_name, branch: branch })
  }

  scope :by_branch, lambda { |branch|
    joins(:category).where(categories: { branch: branch })
  }

  scope :search, lambda { |search|
    where('title ILIKE lower(?) OR content ILIKE lower(?)', "%#{search}%", "%#{search}%")
  }
end

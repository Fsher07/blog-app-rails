class User < ApplicationRecord
  validates :name, presence: true, format: { with: /[a-zA-Z]/ }
  validates_numericality_of :postscounter, only_integer: true, greater_than_or_equal_to: 0

  has_many :comments
  has_many :likes
  has_many :posts

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

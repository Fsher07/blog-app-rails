class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /[a-zA-Z]/ }
  validates_numericality_of :postscounter, only_integer: true, greater_than_or_equal_to: 0

  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: :author_id

  after_initialize :set_defaults

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_defaults
    self.postscounter ||= 0
  end
end

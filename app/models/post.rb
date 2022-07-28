class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal_to: 0

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_counter

  after_destroy :update_post_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.update(postscounter: author.posts.size)
  end

  private

  def set_defaults
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end

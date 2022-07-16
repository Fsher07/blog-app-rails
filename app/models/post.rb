class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def self.recent_comments(comments)
    comments.order(created_at: :desc).limit(5)
  end

  def self.update_post_counter(author)
    author.increment!(:postscounter)
  end
end

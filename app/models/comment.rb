class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comments_count
  after_destroy :update_comments_count

  def update_comments_count
    post.update(comments_counter: post.comments.size)
  end
end

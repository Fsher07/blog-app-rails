class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def self.update_comments_counter(post)
    post.increment!(:comments_counter)
  end
end

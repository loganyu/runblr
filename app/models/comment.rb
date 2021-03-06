class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_comment_id, :post_id, :user_id

  validates :body, presence: true
  validates :user, presence: true
  validates :post, presence: true

  belongs_to :post, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
  has_many :user_comment_likes, inverse_of: :comment

  has_many( :child_comments,
           class_name: "Comment",
           foreign_key: :parent_comment_id,
           primary_key: :id)
  belongs_to :parent_comment, class_name: "Comment", foreign_key: :parent_comment_id, primary_key: :id

  def likes
    self.user_comment_likes.sum(:value)
  end

end

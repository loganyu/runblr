class Post < ActiveRecord::Base
  attr_accessible :post_type, :title, :body, :workout_type, :workout_date, :workout_time, :miles, :hours, :minutes, :seconds, :url, :user_id, :photo

  validates :title, presence: true
  validates :user, presence: true
  validates :photo, presence: { :message => "must be attached" }, if: "post_type == 'photo'"
  validates :body, presence: true, if: "post_type == 'quote'"
  validates :url, presence: true, if: "post_type == 'video' || post_type == 'link'"

  belongs_to :user, inverse_of: :posts
  has_many :user_post_likes, inverse_of: :post
  has_many :comments, inverse_of: :post

  has_attached_file :photo, :styles => {
    :big => "600x600>",
    :small => "420x400#"
  }

  def likes
    self.user_post_likes.sum(:value)
  end

  def comments_by_parent
    comments_by_parent = Hash.new { |hash, key| hash[key] = [] }

    comments.each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end

    comments_by_parent
  end
  
end

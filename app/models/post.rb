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
  
  def self.youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="420" height="256" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
  
end

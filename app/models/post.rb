class Post < ApplicationRecord
  include Commentable
   #если удалить пост удалятся и комментарии связанные с ним
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  
  validates :title, presence: true, length: {minimum: 1, maximum: 161}
  validates :body, presence: true, length: {minimum: 1}

  scope :all_by_tags, ->(tags) do
    posts = includes(:user)
    if tags
      posts = posts.joins(:tags).where(tags: tags).preload(:tags)
    else
      posts = posts.includes(:post_tags, :tags)
    end
     
    posts.order(created_at: :desc)
  end

  def self.search(search)
    if search 
        where(["title LIKE ?","%#{search}%"])
    else
        all
    end
  end

end

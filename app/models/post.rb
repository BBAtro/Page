class Post < ApplicationRecord
  has_many :comments, dependent: :destroy #если удалить пост удалятся и комментарии связанные с ним
  belongs_to :user
  
  validates :title, presence: true, length: {minimum: 1, maximum: 161}
  validates :body, presence: true, length: {minimum: 1}

  # def formatted_created_at
  #   created_at.strftime('%H:%M %d.%m.%Y')
  # end

  def self.search(search)
    if search 
        where(["title LIKE ?","%#{search}%"])
    else
        all
    end
  end

end

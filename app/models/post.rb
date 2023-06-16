class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 5}

  def formatted_created_at
    created_at.strftime('%H:%M %d.%m.%Y')
  end

  def self.search(search)
    if search 
        where(["title LIKE ?","%#{search}%"])
    else
        all
    end
  end

end

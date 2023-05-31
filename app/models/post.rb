class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 5}

  def formatted_created_at
    created_at.strftime('%Y.%m.%d %H:%M')
  end

end

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: {minimum: 1}

  # def formatted_created_at
  #   created_at.strftime('%H:%M %d.%m.%Y')
  # end

  
end

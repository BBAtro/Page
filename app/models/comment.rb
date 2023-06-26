class Comment < ApplicationRecord
  belongs_to :post 
  belongs_to :user

  validates :body, presence: true

  def formatted_created_at
    created_at.strftime('%H:%M %d.%m.%Y')
  end
end

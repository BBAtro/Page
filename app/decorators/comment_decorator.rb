class CommentDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def formatted_created_at
    created_at.strftime('%H:%M %d.%m.%Y')
  end
end

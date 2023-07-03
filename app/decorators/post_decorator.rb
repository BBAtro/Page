class PostDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user #чтобы user декорировался сразу

  def formatted_created_at 
    created_at.strftime('%H:%M %d.%m.%Y')
  end

end

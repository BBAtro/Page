class UserDecorator < ApplicationDecorator
  delegate_all

  def gravatar(size, css_class)
    email_hash = Digest::MD5.hexdigest email.strip.downcase #преобразуем email в хэш

    h.image_tag "https://www.gravatar.com/avatar/#{email_hash}.jpg?s=#{size}",
    # h обозначает что хочу использовать тэг RoR
    class: css_class, alt: "none_img"

  end

end

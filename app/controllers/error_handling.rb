module ErrorHandling
  extend ActiveSupport::Concern

  included do 
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private
  
    def notfound #вывод ошибки в случае ненахождения индекса
      render file: 'public/404.html', status: :not_found, layout: false
    end 
  end
end
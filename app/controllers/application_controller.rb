class ApplicationController < ActionController::Base
  include Authentication
  include ErrorHandling
end

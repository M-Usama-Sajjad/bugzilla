class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError  do
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end

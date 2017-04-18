class ApplicationController < ActionController::Base
  before_action :authenticate
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

 def logged_in?
   authenticate_or_request_with_http_token do |token, options|
     begin
     Account.from_token(token)
     rescue JWT::DecodeError
       false
     end
   end
 end
  #
  # def logged_in?
  #   !!session[:account_id]
  # end
  #
  # def current_user
  #   Account.find(session[:account_id]) if logged_in?
  # end
  #
  # def require_login
  #   unless logged_in?
  #     redirect_to root_path
  #   end
  # end
  #
  # def set_accounts
  #   @accounts = Account.all
  # end

end

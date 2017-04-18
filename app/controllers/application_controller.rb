require "byebug"
class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  def authenticate
    byebug
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

 # def logged_in?
 #   authenticate_or_request_with_http_token do |token, options|
 #     begin
 #     Account.from_token(token)
 #     rescue JWT::DecodeError
 #       false
 #     end
 #   end
 # end
 private
    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer
        (.*)$/).flatten.last
    end

    def auth(token)
     Auth.decode(token)
    end

    def auth_present?

      !!request.env.fetch("HTTP_AUTHORIZATION",
      "").scan(/Bearer/).flatten.first
    end

    def logged_in?
      authenticate_or_request_with_http_token do |token, options|
        begin
        Account.from_token(token)
        rescue JWT::DecodeError
          binding.pry
          false
        end
      end
    end
end

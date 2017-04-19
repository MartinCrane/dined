require "byebug"
require "auth"

class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def logged_in?
    current_account
    !!@current_account
  end

  def current_account
    if auth_present?
      account = Account.find(Auth.decode(token)['account_id'])
      if account
        @current_account = account
      end
    end
  end
  #
  private

  def token
    request.headers['Authorization']
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.headers['Authorization']
  end


end

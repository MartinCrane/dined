require "byebug"
require "auth"

class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def ping
    if logged_in?
      render json: {logged_in: "true"}, status: 200
    else
      render json: {logged_in: "false"}, status: 401
    end
  end

  def logged_in?
    current_account
  end

  def current_account
    if auth_present?
      response =  Auth.decode(token)
      if response
        account = Account.find(Auth.decode(token)['account_id'])
        if account
          @current_account = account
        end
      end
    end
    !!@current_account
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

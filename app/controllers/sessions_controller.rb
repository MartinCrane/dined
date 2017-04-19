require 'byebug'

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    account = Account.authenticate(account_params[:email], account_params[:password])
    if account
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token, email: account.email}
    else
      render json: {error: "Bad email or password"}, status: 401
    end
  end

  private

  def account_params
    params.require(:session).permit(:email, :password)
  end

end

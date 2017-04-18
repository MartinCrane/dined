class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new
    @account=Account.new
  end

  def create
    account = Account.authenticate(account_params[:email], account_params[:password])
    if account
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {error: "Bad email or password"}, status: 401
    end
  end

  # def create
  #   account = Account.find_by(email: login_params[:email])
  #   if account && account.authenticate(login_params[:password])
  #     session[:account_id]=account.id
  #     redirect_to root_path
  #   else
  #     flash[:error]="Something went wrong"
  #     redirect_to root_path
  #   end
  #   respond_to :html, :js
  # end
  #
  # def destroy
  #   reset_session
  #   redirect_to "/"
  # end

  private

  def account_params
    params.require(:account).permit(:email, :password)
  end

end

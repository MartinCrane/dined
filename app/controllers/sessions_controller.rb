class SessionsController < ApplicationController

  def new
    @account=Account.new
  end

  def create
    account = Account.find_by(email: login_params[:email])
    if account && account.authenticate(login_params[:password])
      session[:account_id]=account.id
      redirect_to root_path
    else
      flash[:error]="Something went wrong"
      redirect_to root_path
    end
    respond_to :html, :js
  end

  def destroy
    reset_session
    redirect_to "/"
  end

  private

  def login_params
    params.require(:account).permit(:email, :password)
  end

end

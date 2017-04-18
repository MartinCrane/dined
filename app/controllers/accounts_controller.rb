class AccountsController < ApplicationController
  skip_before_action :authenticate

  # def new
  #   @account=Account.new
  # end

  def create
    account = Account.new(account_params)
    if account.save
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {errors: account.errors}, status: 401
    end
  end
  # def create
  #   account = Account.new(account_params)
  #   if account.valid?
  #     account.save
  #     redirect_to root_path
  #   else
  #     flash[:error]="Something went wrong"
  #     redirect_to root_path
  #   end
  # end

  private

  def account_params
    params.require(:account).permit(:email, :password)
  end
end

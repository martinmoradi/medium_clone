class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      redirect :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :pseudo,
      :first_name,
      :last_name,
      :email,
      :age,
      :description,
      :password,
      :password_confirmation
    )
  end

end

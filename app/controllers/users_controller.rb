class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Account created successfully.'
    else
      render :new
    end
  end

  def show
    @current_borrowings = current_user.borrowings.active.includes(:book)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
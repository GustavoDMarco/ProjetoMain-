# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new
    end
  end

  def after_sign_up_path_for(resource)
    root_path
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end

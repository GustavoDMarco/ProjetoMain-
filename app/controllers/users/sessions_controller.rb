# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
 end

 def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      redirect_to new_user_registration_path, alert: 'Account not found. Please, register!'
    else
      super
    end
 end

 def after_sign_in_path_for(resource)
  root_path
end


 private

 def configure_sign_in_params
    params.permit(:email, :password, :remember_me)
 end
end

class ApplicationController < ActionController::Base
  # devise>registration_controller.rbの上書きをここでしている
  # deviseでログイン後にマイページへ遷移する
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # deviseでサインイン後にマイページへ遷移する
  def after_inactive_sign_up_path_for(resource)
    user_path(resource.id)
  end

  # deviseのuserモデルに追加したカラムを新規登録出来るようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  # deviseのユーザでパスワードなしで更新する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # deviseで更新後にマイページへ遷移する
  def after_update_path_for(resource)
    user_path(resource.id)
  end

  # deviseに追加したカラムを更新出来るようにする
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

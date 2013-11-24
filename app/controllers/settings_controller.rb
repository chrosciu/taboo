class SettingsController < ApplicationController
  before_filter :load_setting

  def edit
  end

  def update
    if @setting.update setting_param
      redirect_to root_path
    else
      render :edit
    end
  end

  protected

  def load_setting
    @setting = Setting.instance
  end

  def setting_param
    params.fetch(:setting, {}).permit(:timeout)
  end
end

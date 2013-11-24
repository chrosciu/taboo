class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic('RESTRICTED ACCESS') do |username, password|
      username == 'test' && password == 'test'
    end
  end
end

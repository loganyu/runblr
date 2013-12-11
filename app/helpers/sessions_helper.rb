module SessionsHelper
  def login_user!(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def current_user
    return nil if session[:token].nil?
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def authenticate_user!
    redirect_to new_session_url unless current_user
  end

  def new_user?
    redirect_to user_dashboard_url(current_user) if current_user
  end
end

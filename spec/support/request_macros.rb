module RequestMacros
  def login_user(user)
    page.driver.post user_session_path, :user => {:email => user.email, :password => user.password}
  end
end
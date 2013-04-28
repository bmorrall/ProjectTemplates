module RequestMacros

  def login_user(user)
    user ||= FactoryGirl.create :user
    post user_session_path, :user => { :email => user.email, :password => user.password }
  end

end
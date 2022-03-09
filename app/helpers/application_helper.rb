module ApplicationHelper
  def isLoggedIn?
    !!current_user
  end
end

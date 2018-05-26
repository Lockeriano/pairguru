module TopCommentersHelper
  def top_commenters
    @users = User.order('comments_count DESC').limit(10)
  end
end

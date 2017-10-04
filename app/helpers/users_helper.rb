module UsersHelper
  def get_ranking
    User.where(student: true).order(experience: :desc)
  end

  def get_user_experience user
    user.experience
  end

end

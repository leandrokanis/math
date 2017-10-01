module UsersHelper
  def get_ranking
    User.where(student: true).order(experience: :desc)
  end
end

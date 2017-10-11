module UsersHelper
  def get_ranking
    User.where(student: true).order(experience: :desc)
  end

  def get_user_experience user
    user.experience
  end

  def total_missions_complete(user)
    Survey::Attempt.where(participant_id:user.id,winner:true).map(&:survey_id).uniq.count
  end
end

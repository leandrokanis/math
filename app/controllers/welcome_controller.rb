class WelcomeController < ApplicationController
  def index
      @surveys = Survey::Survey.all
      @lessons = Lesson.all.order(created_at: :asc)
  end

  def show
  end
end

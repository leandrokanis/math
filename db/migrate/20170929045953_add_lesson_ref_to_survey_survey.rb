class AddLessonRefToSurveySurvey < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :lesson, index: true, foreign_key: true
  end
end

class AddAttachmentImageToSurveyQuestions < ActiveRecord::Migration
  def up
    add_attachment :survey_questions, :image
  end

  def down
    remove_attachment :survey_questions, :image
  end
end

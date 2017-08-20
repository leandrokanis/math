class AddAttachmentImageToQuestions < ActiveRecord::Migration
  def self.up
    change_table :survey_questions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :survey_questions, :image
  end
end

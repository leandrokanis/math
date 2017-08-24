class AddBloomLevelToSurveySurvey < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :bloom_level, :integer
  end
end

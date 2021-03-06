class SurveysController < ApplicationController

  before_filter :load_survey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    type = view_context.get_survey_type(params[:type])
    query = if type then Survey::Survey.where(survey_type: type) else Survey::Survey end
    if params[:lesson]
      @surveys = query.where(lesson_id:params[:lesson]).order(bloom_level: :asc, created_at: :asc).page(params[:page]).per(16)
      @lesson = Lesson.find(params[:lesson])
    else
      @surveys = query.order(created_at: :desc).page(params[:page]).per(15)
    end
  end

    def new
      @survey = Survey::Survey.new(survey_type: view_context.get_survey_type(params[:type]))
    end

    def create
      @survey = Survey::Survey.new(params_whitelist)
      if @survey.valid? && @survey.save
        redirect_to surveys_path(lesson: @survey.lesson_id)
      else
        build_flash(@survey)
        render :new
      end
    end

    def edit
      @lesson = Lesson
    end

    def show
    end

    def update
      if @survey.update_attributes(params_whitelist)
        redirect_to surveys_path(lesson: @survey.lesson_id)
      else
        build_flash(@survey)
        render :edit
      end
    end

    def destroy
      @survey.destroy
      default_redirect
    end

    private

    def default_redirect
      redirect_to surveys_path, notice: I18n.t("surveys_controller.#{action_name}")
    end

    def load_survey
      @survey = Survey::Survey.find(params[:id])
    end

    def params_whitelist
      #Survey::Question::AccessibleAttributes << :image
      #lista = Survey::Survey::AccessibleAttributes << :survey_type


      params.require(:survey_survey).permit(
        :name,
        :description,
        :finished,
        :active,
        :attempts_number,
        :survey_type,
        :lesson_id,
        :bloom_level,
        :id,
        :_destroy,
        :questions_attributes => [
          :text,
          :survey,
          :image,
          :id,
          :_destroy,
          :options_attributes => [:text, :correct, :weight, :id, :_destroy]
        ]
        )
      end
    end

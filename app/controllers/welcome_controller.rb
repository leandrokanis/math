class WelcomeController < ApplicationController
  def index
      @surveys = Survey::Survey.all
  end

  def show
  end
end

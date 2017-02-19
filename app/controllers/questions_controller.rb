class QuestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Question.create(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end

class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @questions = Question.order(created_at: "DESC").limit(3)
    # .pluck(:title, :question, :answer, :created_at)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_question_path,  notice: "問題を登録しました。"
    else
      redirect_to new_question_path,  notice: "エラーが発生しました。"
    end
  end

  private
  
  def question_params
    params.require(:question).permit(:title, :question, :answer)
  end

end

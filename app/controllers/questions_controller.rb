class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: "DESC").limit(20)
  end

  def new
    @question = Question.new
    @questions = Question.order(created_at: "DESC").limit(3)
  end

  def create
    @questions = Question.order(created_at: "DESC").limit(3)
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_question_path,  notice: "問題を登録しました。"
    else
      render :new,  notice: "問題が発生しました。"
    end
  end

  private
  
  def question_params
    params.require(:question).permit(:title, :question, :answer)
  end

end

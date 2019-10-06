class QuestionsController < ApplicationController

  def index
    @questions = current_user.questions.recent.limit(20)
  end

  def new
    @question = Question.new
    @questions = current_user.questions.recent.limit(3)
  end

  def create
    @questions = Question.order(created_at: "DESC").limit(3)
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_question_path,  notice: "問題を登録しました。"
    else
      flash.now[:notice] = "問題が発生しました。"
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :question, :answer).merge(user_id: current_user.id)
  end

end

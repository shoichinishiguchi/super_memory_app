class QuestionsController < ApplicationController
  before_action :set_questions, only: %i[index]


  def index
  end

  def new
    @question = Question.new
    @questions = current_user.questions.recent
  end

  def create
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
    params.require(:question).permit(:title, :question, :answer).merge(user_id: current_user.id, last_ans_date: Time.now)
  end

  def set_questions
    @questions = current_user.questions.should_ans_order
  end

end

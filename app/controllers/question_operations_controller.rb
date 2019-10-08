class QuestionOperationsController < ApplicationController
  before_action :question_set

  def correct
    importance = @question.importance
    correct_cnt = @question.correct_cnt + 1
    importance -= 1 if importance > 0
    @question.update(importance: importance , correct_cnt: correct_cnt )
  end

  def wrong
    importance = @question.importance
    wrong_cnt = @question.wrong_cnt + 1
    importance += 1 if importance < 5
    @question.update(importance: importance , wrong_cnt: wrong_cnt )
  end

  def importance_change
    @question.update(importance: params[:importance])
  end

  private

  def question_set
    @question = Question.find(params[:question_id])
  end

end

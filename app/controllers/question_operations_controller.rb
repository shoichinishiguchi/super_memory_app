class QuestionOperationsController < ApplicationController
  before_action :question_set

  def correct
    importance = @question.importance
    correct_cnt = @question.correct_cnt + 1
    importance -= 1 if importance > 0
    @question.update(importance: importance , correct_cnt: correct_cnt, last_ans_date: Time.now, next_ans_date: next_ans_date(importance))
  end

  def wrong
    importance = @question.importance
    wrong_cnt = @question.wrong_cnt + 1
    importance += 1 if importance < 5
    @question.update(importance: importance , wrong_cnt: wrong_cnt, last_ans_date: Time.now, next_ans_date: next_ans_date(importance))
  end

  def importance_change
    importance = params[:importance]
    @question.update(importance: importance, last_ans_date: Time.now, next_ans_date: next_ans_date(importance))
  end

  private

  def question_set
    @question = Question.find(params[:question_id])
  end

  def next_ans_date(importance)
    case importance
    when 0
      Time.now + 6.months
    when 1
      Time.now + 3.months
    when 2
      Time.now + 1.month
    when 3
      Time.now + 7.days
    when 4
      Time.now + 3.days
    when 5
      Time.now + 12.hours
    end
  end

end

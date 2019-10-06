class Question < ApplicationRecord
  validates :title, presence:true, length: {maximum: 50}
  validates :question, presence:true, length: {maximum: 500}
  validates :answer, presence:true, length: {maximum: 500}

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def created_time
    (created_at + 9.hour).strftime("%Y/%-m/%-d %-H:%-M:%-S")
  end

  def ans_count
    all_cnt = correct_cnt + wrong_cnt
    if all_cnt == 0
      "未回答"
    else
      correct_cnt.to_s + " / " + all_cnt.to_s
    end
  end

end

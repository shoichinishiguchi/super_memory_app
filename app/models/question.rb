class Question < ApplicationRecord
  validates :title, presence:true, length: {maximum: 50}
  validates :question, presence:true, length: {maximum: 500}
  validates :answer, presence:true, length: {maximum: 500}

  belongs_to :user

  scope :recent, -> { order(created_at: "DESC") }
  scope :remaining_time_asc, -> { order(next_ans_date: "ASC")}

  def created_time
    (created_at + 9.hour).strftime("%Y/%m/%d %H:%M:%S")
  end

  def last_ans_time
    (last_ans_date + 9.hour).strftime("%Y/%m/%d %H:%M:%S")
  end

  def ans_count
    all_cnt = correct_cnt + wrong_cnt
    if all_cnt == 0
      "未回答"
    else
      correct_cnt.to_s + " / " + all_cnt.to_s
    end
  end

  def time_to_ans
    remaining_time = (self.last_ans_date - Time.now).to_i
    case importance
    when 0 # +6ヶ月
      remaining_time += 6*30*24*60*60
    when 1 # +3ヶ月
      remaining_time += 3*30*24*60*60
    when 2 # +1ヶ月
      remaining_time += 1*30*24*60*60
    when 3 # +7日
      remaining_time += 7*24*60*60
    when 4 # +3日
      remaining_time += 3*24*60*60
    when 5 # 12時間後
      remaining_time += 12*60*60
    end
    sec = remaining_time + 60 #表示上60秒微調整
    min = sec/60%60
    hour = sec/3600%24
    day = sec/3600/24
    "次の解答まで、あと#{day.to_s}日#{hour.to_s}時間#{min.to_s}分"
  end
end

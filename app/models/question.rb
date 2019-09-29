class Question < ApplicationRecord
  def created_time
    (created_at + 9.hour).strftime("%Y/%-m/%-d %-H:%-M:%-S")
  end
end

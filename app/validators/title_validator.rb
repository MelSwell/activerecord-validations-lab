class TitleValidator < ActiveModel::Validator

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  
  def validate(record)
    CLICKBAIT_PATTERNS.each do |pattern|
      if !record.title.match(pattern)
        record.errors.add :title, "Title is not click-baity enough"
      end
    end
  end
end
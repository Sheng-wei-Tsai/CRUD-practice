module ApplicationHelper
  def user_gender(gender)
    if gender == 1
      "boy"
    elsif gender == 0
      "girl"
    else
      "I don't want to talk"
    end
  end
end

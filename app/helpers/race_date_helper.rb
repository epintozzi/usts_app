module RaceDateHelper

  def short_race_date(date)
    date.strftime("%b %-d")
  end

  def long_race_date(date)
    date.strftime("%b %-d, %Y")
  end

end

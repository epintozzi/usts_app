module RaceDateHelper

  def short_race_date(date)
    date.strftime("%b %-d")
  end

end

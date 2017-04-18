module NewsDateHelper

  def news_date(date)
    date.strftime("%b %-d, %Y")
  end

end

module YearHelper
  def year_options
    [
      [Date.current.last_year.year],
      [Date.current.year],
      [Date.current.next_year.year]
    ]
  end
end

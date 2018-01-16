module YearHelper
  def year_options
    [
      [Date.current.year],
      [Date.current.next_year.year]
    ]
  end

  def default_year
    # Returns next year if it is after Oct 1 and there are no future races scheduled
    if Race.races_this_year.future.empty? && (Date.today > Date.parse('October 1'))
      Date.current.next_year.year
    else
      Date.current.year
    end
  end
end

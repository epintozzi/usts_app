module YearHelper
  def year_options
    [
      [Date.current.year],
      [Date.current.next_year.year]
    ]
  end

  def default_year
    # possibly change because this will fail if there are inteded to be more races
    # in the season that haven't been to the site yet. Unlikely this scenario would
    # occur, but it could.
    if Race.races_this_year.future.empty?
      Date.current.next_year.year
    else
      Date.current.year
    end
  end
end

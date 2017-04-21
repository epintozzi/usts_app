module RaceNameHelper

  def list_of_race_titles_and_cities
    return Race.title_location_list
  end

end

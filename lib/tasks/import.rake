require 'csv'

namespace :import do
  desc "import olympics data from CSV"
  task olympians: :environment do
    CSV.foreach('./lib/data/olympic_data_2016.csv', headers: true) do |row|
      athlete = Athlete.find_or_create_by!(name: row['Name'],
                                          age: row['Age'],
                                          sex: row['Sex'],
                                          height: row['Height'],
                                          weight: row['Weight'],
                                          team: row['Team'])
      sport = Sport.find_or_create_by!(name: row['Sport'])
      event = sport.events.find_or_create_by!(name: row['Event'],
                                              games: row['Games'])
      event.athlete_events.find_or_create_by!(medals: row['Medal'],
                                              athlete_id: athlete.id)
    end
  end
end

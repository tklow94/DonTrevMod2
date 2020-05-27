# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './lib/json_by_url'

def conv_epoch(epoch)
    Time.at(epoch.to_i / 1000).to_datetime
end

resp = JSONByURL.new 'https://www.bovada.lv/services/sports/event/v2/events/A/description'


if resp.clean
    data = resp.json

    data.each do |league|
        league["events"].each do |event|
            bldr = {description: event["description"], link: event["link"], event_id: event["id"],
                        start_time: conv_epoch(event["startTime"]),
                        live: event["live"], last_modified: conv_epoch(event["lastModified"])}
            puts "Creating event #{bldr[:description]}"
            Event.create(bldr)
        end
    end
else
    puts "Retrieval Error from https://www.bovada.lv/services/sports/event/v2/events/A/description"
end
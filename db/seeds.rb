require './lib/json_by_url'

Event.destroy_all
Sport.destroy_all

def conv_epoch(epoch)
    Time.at(epoch.to_i / 1000).to_datetime #trim milliseconds from epoch time
end

resp = JSONByURL.new 'https://www.bovada.lv/services/sports/event/v2/events/A/description'


if resp.clean
    data = resp.json

    byebug
    data.each do |league|

        sport = Sport.find_or_create_by(name: league["path"][1]["sportCode"])

        league["events"].each do |event|  #BigO faster to push into array and create at "once"?
            bldr = {description: event["description"], link: event["link"], event_id: event["id"],
                        start_time: conv_epoch(event["startTime"]), sport_id: sport.id, event_type: event["type"],
                        last_modified: conv_epoch(event["lastModified"])}
            puts "Creating event #{bldr[:description]}"
            Event.create(bldr)
        end
    end
else
    puts "Error Retrieving: https://www.bovada.lv/services/sports/event/v2/events/A/description"
end
require './lib/json_by_url'

Event.destroy_all
Sport.destroy_all

def conv_epoch(epoch)
    Time.at(epoch.to_i / 1000).to_datetime #trim milliseconds from epoch time
end

resp = JSONByURL.new 'https://www.bovada.lv/services/sports/event/v2/events/A/description'


if resp.clean
    data = resp.json

    data.each do |league|
        link = league["path"][0]["link"]
        sport_attributes = link.split("/", 3)[1..]
        sport = Sport.find_or_create_by(sport_name: sport_attributes[0], sub_name: sport_attributes[1])

        league["events"].each do |e|  #BigO faster to push into array and create at "once"?
            bldr = {description: e["description"], link: e["link"], event_id: e["id"],
                        start_time: conv_epoch(e["startTime"]), sport_id: sport.id, event_type: e["type"],
                        last_modified: conv_epoch(e["lastModified"])}
            puts "Creating event #{bldr[:description]}"
            event = Event.create(bldr)
            
            e["displayGroups"].each do |b|
                byebug
                b
            end
        end
    end
else
    puts "Error Retrieving: https://www.bovada.lv/services/sports/event/v2/events/A/description"
end
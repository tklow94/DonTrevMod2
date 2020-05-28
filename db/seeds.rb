require './lib/json_by_url'

# Event.destroy_all
# Sport.destroy_all
# Market.destroy_all
# Outcome.destroy_all

# ActiveRecord::Base.connection.tables.each do |t|
#     ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

def conv_epoch(epoch)
    Time.at(epoch.to_i / 1000).to_datetime #trim milliseconds from epoch time
end

system "clear"
puts "Fetching Current Info from Bovada.lv ..."
resp = JSONByURL.new 'https://www.bovada.lv/services/sports/event/v2/events/A/description'


if resp.clean
    data = resp.json

    involvements_import, events_import = [], []

    data.each do |league|
        link = league["path"][0]["link"]
        sport_attributes = link.split("/", 3)[1..]
        sport_attributes[1] = sport_attributes[1].gsub("/", " - ") #remove / which will throw Rails errors for security    need to fix some other time
        
        sport = Sport.find_or_create_by(sport_name: sport_attributes[0].titlecase, sub_name: "#{sport_attributes[1].titlecase}")
        
        puts "Building Models for #{link}"

        league["events"].each do |e|  
            bldr = {description: e["description"], link: e["link"], bovada_id: e["id"],
                        start_time: conv_epoch(e["startTime"]), sport_id: sport.id, event_type: e["type"],
                        last_modified: conv_epoch(e["lastModified"])}
            
            event = Event.new(bldr) #WOULD BE MODIFIED TO AVOID DUPLICATE EVENT DATA IN LOG-LIVE-DATA PHASE
            
            comps = e["competitors"]
            unless comps.empty?
                comps.each do |z|
                    comp = Competitor.find_or_create_by(sub_name: sport.sub_name, sport_name: sport.sport_name, name: z["name"], bovada_id: z["id"].split("-")[1])
                    inv = event.involvements.build(competitor: comp)
                end
            end

            e["displayGroups"].each do |b|
                
                market_type = b["description"]

                b["markets"].each do |c| #BELOW WOULD BE MODIFIED TO AVOID DUPLICATE MARKET DATA IN FUTURE
                    market = event.markets.build(bovada_id: c["id"], market_type: market_type,
                         description: c["description"], period: c["period"]["description"], 
                         live: c["period"]["live"])
                    
                    
                    unless c["outcomes"].empty?  #sometimes no bet outcomes available, possibly when bet taken down temp.
                        c["outcomes"].each do |j|  #BELOW WOULD BE MODIFIED TO LOG LIVE BET DATA IN FUTURE OVER TIME
                            market.outcomes.build(american: j["price"]["american"], decimal: j["price"]["decimal"],
                                description: j["description"], market_id: market.id, bovada_id: j["id"],
                                bovada_status: j["status"], bovada_type: j["type"])
                        end
                    end
                end
                
            end
            
            events_import << event  #markets and outcomes built, headed for next Event
        end
    end
    
    system "clear"
    puts "Generating Models! Hold on to your butts..."
    Event.import events_import, recursive: true
    system "clear"
    puts "Complete!"
    puts "Created #{Sport.count} Sport models"
    puts "Created #{Competitor.count} Competitor models"
    puts "Created #{Event.count} Event models"
    puts "Created #{Market.count} Market models"
    puts "Created #{Involvement.count} Involvement models"
    puts "Created #{Outcome.count} Outcome models"


else
    puts "Error Retrieving: https://www.bovada.lv/services/sports/event/v2/events/A/description"
end
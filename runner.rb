
require 'csv'
require_relative 'album'
require 'pry'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
  album.tracks << track
  album.duration_min += track[:duration_ms].to_f / (1000 * 60)

end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end

=begin
album_id,track_id,title,track_number,duration_ms,album_name,artists
60mvULtYiNSRmpVvoa3RE4,4pn0G7yHNfTgRYRWca8gYA,We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song],1,222466,We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song],Pitbull
4JXziyWNlxM4oPw34PMjVj,4TodN6on0egMGf46YPk5oZ,Revenge of the Lol Cat,1,200687,A13,Garnier
4JXziyWNlxM4oPw34PMjVj,4UzpPEH482FOkIesWLVgjg,Wise Words for No-Life Guacamoles,2,289312,A13,Garnier
4JXziyWNlxM4oPw34PMjVj,
=end

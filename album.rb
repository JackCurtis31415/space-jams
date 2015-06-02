
class Album

  attr_accessor :id, :title, :artists, :tracks, :duration_min

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
    @duration_min = 0
  end

  def tracks
    @tracks
  end

  # def artist_list
  #   artist_string = ""
  #   artists.each do |artist|
  #     artist_string << "#{artist}, "
  #   end
  #   artist_string = artist_string[0..-3]
  # end

  def track_list
    track_string = ""
    tracks.each do |track|
      track_string << "- #{track[:title]}\n"
    end
    track_string
  end

  def summary
    <<-SUMMARY
Name: #{title}
Artist(s): #{artists}
Duration (min.): #{duration_min}
Tracks: #{track_list}
SUMMARY
  end
end

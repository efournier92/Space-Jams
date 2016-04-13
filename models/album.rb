class Album
  attr_reader :id, :name, :artists, :tracks

  def initialize (album_id, album_name, artists)
    @id = album_id
    @name = album_name
    @artists = artists
    @tracks = []
  end

  def tracks_joiner
    tracks_array = []
    @tracks.each do |track|
      tracks_array << " * #{track.title}"
    end
    tracks_array.join("\n")
  end

  def album_duration_adder
    total_duration_ms = 0
    @tracks.each do |track|
      total_duration_ms += track.duration_ms.to_i
    end
    total_duration_ms
  end

  def ms_to_min(duration_ms)
    minutes = duration_ms.to_i / 60000
    seconds = ( duration_ms.to_i % 60000 ) / 1000
    output = "#{minutes.to_s}:#{"%02d" % seconds.to_s}"
  end
end

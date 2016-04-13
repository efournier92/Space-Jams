 require_relative 'classes'
require 'csv'
require 'pry'

SEP1 = '******************************************************************'
SEP2 = '------------------------------------------------------------------'

albums = []
# Iterate through each row of CSV file
CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |uniq_album| uniq_album.id == track[:album_id] }
  tracks = []
  if album.nil? # Create new album instance if album isn't already in array
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end
  # Create new Track instance for each track, and store them in @tracks array
  album.tracks << Track.new(track[:album_id], track[:track_id],
  track[:title], track[:track_number], track[:duration_ms])
end

# Print summary for each album
albums.each do |album|
  puts "#{SEP1}\nALBUM NAME: #{album.name}\nARTIST: #{album.artists}"
  total_duration_ms = album.album_duration_adder
  puts "DURATION: #{album.ms_to_min(total_duration_ms)}"
  puts "#{SEP2}\nTRACKS:"
  puts album.tracks_joiner
  puts SEP2
end

#Space-Jams

This is a ruby application I wrote to practice building classes with instance methods.

My seed data consists of a list of tracks in `data.csv`.

My code takes the data in that file, and outputs summary information about each album in the CSV.
`models/album.rb` contains the following instance methods:

* `id`   - returns the ID of the album
* `title` - returns the title of the album
* `artists` - returns the name of the artist(s) on the album
* `tracks` - returns an array of hashes representing each track on the album
* `duration_min` - returns the duration of the album in minutes (`duration_ms` in the CSV is duration in milliseconds)
* `summary` - returns a string of summary information about the album in the following format:

`models/track.rb` contains a track model. An album is composed of many tracks.

`app.rb` file contains code that reads in the CSV data, creates a new `Album` object for each album in the data, and prints out the summary for each album

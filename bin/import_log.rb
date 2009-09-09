filename = ARGV[ 0 ]

importer = LogFileImporter.new

File.open( filename, 'r' ) do |file|
  importer.import( file )
end

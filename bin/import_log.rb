filename = ARGV[ 0 ]

importer = LogFileImporter.new

File.open( filename, 'r' ) do |file|
  ActiveRecord::Base.cache do
    importer.import( file )
  end
end

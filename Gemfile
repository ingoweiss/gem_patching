File.foreach('prosecco.gemspec') do |line|
  if line.match(/gem\.add_dependency +'([^']+)'(, +'([^']+)')?/)
    gem_name, gem_version = $1, $3
    gem *[gem_name, gem_version].compact 
  end
end

group :test do
  gem 'mocha'
end
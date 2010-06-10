Gem::Specification.new do |gem|
  gem.name    = 'gem_patching'
  gem.version = '0.0.1'
  gem.summary = 'For managing patches for other gems'
  gem.description = 'gem_patching provides a mechanism for marking code as a patch for a specific version of a gem in order to get notified when that gem is updated'
  gem.files = Dir['lib/**/*']
  gem.authors = ['Ingo Weiss']
  gem.email = 'ingo@ingoweiss.com'
  gem.homepage = 'http://github.com/ingoweiss/gem_patching'
  gem.files = Dir['{lib}/**/*']
end



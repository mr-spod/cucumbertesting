Gem::Specification.new do |s|
  s.name        = 'cucmbertesting'
  s.version     = '0.0.0'
  s.date        = '2018-06-20'
  s.summary     = "Running tests in atom!"
  s.description = "Writing cucmber tests and running them in atom"
  s.authors     = ["Sean O\'Donnell"]
  s.email       = 'sean.odonnell@duethealth.com'
  s.files       = Dir['Rakefile', '{bin,lib}/**/*', 'README*']
  s.license     = 'MIT'

  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "xcodeproj"

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "geminabox"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "rspec"

end

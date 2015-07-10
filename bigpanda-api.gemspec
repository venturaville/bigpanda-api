Gem::Specification.new do |s|
  s.name = "bigpanda-api"
  s.version = "1.0.0"
  s.license = 'MIT'
  s.email = "david-vv@nicklay.com"
  s.homepage = "https://github.com/venturaville/bigpanda-api"
  s.authors = ["David Nicklay"]
  s.summary = "BigPanda API wrapper"
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.description = "Wrapper for BigPanda API"
  s.bindir = "bin"
  s.executables = %w{ }
  %w{ rest-client ripl }.each do |d|
    s.add_dependency d
  end
end


require 'rake'

namespace :gem do
  desc "Install the gem locally"
  task :install do
    puts "Building gem"
    `gem build bigpanda-api.gemspec`
    puts "Installing gem"
    `sudo gem install ./bigpanda-api-*.gem`
    puts "Removing built gem"
    `rm bigpanda-api-*.gem`
  end

  desc "Push gem upstream"
  task :push do
    version = `awk -F \\\" ' /version/ { print $2 } ' bigpanda-api.gemspec`
    version.chomp!
    puts "Building bigpanda-api gem"
    system "gem build bigpanda-api.gemspec"
    puts "Pushing bigpanda-api gem version: #{version}"
    system "gem push bigpanda-api-#{version}.gem"
    puts "Cleaning up bigpanda-api-#{version}.gem"
    File.delete "bigpanda-api-#{version}.gem"
    # To yank:
    #gem yank bigpanda-api -v ${VERSION}
  end
end

namespace :git do
  desc "make a git tag"
  task :tag do
    version = `awk -F \\\" ' /version/ { print $2 } ' bigpanda-api.gemspec`
    version.chomp!
    puts "Tagging git with version=#{version}"
    system "git tag #{version}"
    system "git push --tags"
  end
end


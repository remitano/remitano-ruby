# encoding: utf-8

require 'rubygems'
require 'bundler'
require "bundler/gem_tasks"

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "remitano"
  gem.homepage = "http://github.com/phuongnd08/remitano-ruby"
  gem.license = "MIT"
  gem.summary = %Q{Remitano Ruby API}
  gem.description = %Q{Ruby API for use with Remitano.}
  gem.email = "phuongnd08@gmail.com"
  gem.authors = ["Phuong Gia Su"]
  gem.metadata = { "github_repo" => "ssh://github.com/remitano/remitano-ruby" }
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "remitano #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
#  t.options = '--verbose'
end

task :console do
  exec "irb -r wordsmith-ruby-sdk -I ./lib"
end

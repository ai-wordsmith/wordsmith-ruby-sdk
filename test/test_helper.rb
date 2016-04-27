WORDSMITH_SDK_TEST_TOKEN='923b278a6088675262af64ceb437bab31d7ebc6b07aaf89f88b0b88dd4fe2a97'

require 'dotenv'
Dotenv.load

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'wordsmith-ruby-sdk'
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'

module SetupAndTeardown
  def setup
    Wordsmith.configure do |config|
      config.token = WORDSMITH_SDK_TEST_TOKEN
    end
  end

  def teardown
    Wordsmith.reset
  end
end

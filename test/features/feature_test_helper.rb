require 'sinatra'
require 'capybara'

require_relative "../test_helper"
require_relative '../lib/app.rb'

Capybara.app = IdeaBoxApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

require 'test_helper'
require 'rails'

class AuthproGeneratorTest < Rails::Generators::TestCase
  tests AuthproGenerator
  destination __dir__ + "/rails/dummy"
  #setup :prepare_destination
  #teardown :cleanup_destination_root
  
  test "Assert all files are properly created" do 
    run_generator(["--force"])
    # models
    assert_file "app/models/user.rb"
    
    # controllers
    assert_file "app/controllers/users_controller.rb"
    assert_file "app/controllers/sessions_controller.rb"
    assert_file "app/controllers/password_resets_controller.rb"
    assert_file "app/controllers/home_controller.rb"

    # views
    assert_file "app/views/users/new.html.erb"
    assert_file "app/views/password_resets/new.html.erb"
    assert_file "app/views/password_resets/edit.html.erb"
    assert_file "app/views/sessions/new.html.erb"
    assert_file "app/views/layouts/application.html.erb"
    assert_file "app/views/home/index.html.erb"
    assert_file "app/views/user_mailer/password_reset.text.erb"
  
  end

  # todo: test application_controller injection.
  # todo : test routes
end
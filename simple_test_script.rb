require 'eyes_selenium'

runner = Applitools::ClassicRunner.new
eyes = Applitools::Selenium::Eyes.new(runner: runner)
web_driver = Selenium::WebDriver.for :chrome

eyes.batch = Applitools::BatchInfo.new("Demo Batch")

eyes.configure do |conf|
  conf.app_name = 'Demo App'
  conf.test_name = 'Smoke Test'
  conf.viewport_size = Applitools::RectangleSize.new(800, 600)
end

begin
  # Call Open on eyes to initialize a test session
  driver = eyes.open(driver: web_driver)

  # Navigate to the url we want to test
  driver.get('https://demo.applitools.com')

  # Note to see visual bugs, run the test using the above URL for the 1st run.
  # but then change the above URL to https://demo.applitools.com/index_v2.html (for the 2nd run)

  # check the login page
  eyes.check('Login window', Applitools::Selenium::Target.window.fully)

  # Click the 'Log In' button
  driver.find_element(:id, 'log-in').click

  # Check the app page
  eyes.check('App window', Applitools::Selenium::Target.window.fully)
  eyes.close_async
rescue => e
  puts e.message
  eyes.abort_if_not_closed
ensure
  # Close the browser
  driver.quit
  # Get and print all test results
  puts runner.get_all_test_results
end



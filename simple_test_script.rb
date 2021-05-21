require 'eyes_selenium'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['CI'] == 'true'
# Create a new chrome web driver
web_driver = Selenium::WebDriver.for :chrome

# Initialize the Runner for your test.
runner = Applitools::ClassicRunner.new

# Initialize the eyes SDK
eyes = Applitools::Selenium::Eyes.new(runner: runner)

#  Initialize the eyes configuration.
eyes.configure do |conf|
  # Add this configuration if your tested page includes fixed elements.
  # conf.stitch_mode = Applitools::STITCH_MODE[:css]
  # You can get your api key from the Applitools dashboard
  conf.api_key = ENV['APPLITOOLS_API_KEY']
  # set new batch
  conf.batch = Applitools::BatchInfo.new("Demo Batch")
end

begin
   # Set AUT's name, test name and viewport size (width X height)
   # We have set it to 800 x 600 to accommodate various screens. Feel free to
   # change it.
  driver = eyes.open(driver: web_driver, app_name: 'Demo App', test_name: 'Smoke Test', viewport_size: Applitools::RectangleSize.new(800, 600))

  # Navigate to the url we want to test
  driver.get('https://demo.applitools.com')

  # To see visual bugs after the first run, use the commented line below instead.
  # but then change the above URL to https://demo.applitools.com/index_v2.html (for the 2nd run)

  # Visual checkpoint #1 - Check the login page. using the fluent API
  # https://applitools.com/docs/topics/sdk/the-eyes-sdk-check-fluent-api.html?Highlight=fluent%20api
  eyes.check('Login window', Applitools::Selenium::Target.window.fully)

  # Click the 'Log In' button
  driver.find_element(:id, 'log-in').click

  # Visual checkpoint #2 - Check the app page.
  eyes.check('App window', Applitools::Selenium::Target.window.fully)

  # End the test.
  eyes.close_async
rescue => e
  puts e.message
  # If the test was aborted before eyes.close was called, ends the test as
  # aborted.
  eyes.abort_if_not_closed
ensure
  # Close the browser
  driver.quit

  # Print results
  puts runner.get_all_test_results(true)
end



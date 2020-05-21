# Pre-requisites:

1. Ruby is installed on your machine.
   * [See instructions here](https://www.ruby-lang.org/en/documentation/installation/)
2. Chrome Webdriver is on your machine and is in the PATH. Here are some resources from the internet that'll help you.
   * https://splinter.readthedocs.io/en/0.1/setup-chrome.html
   * https://stackoverflow.com/questions/38081021/using-selenium-on-mac-chrome
   * https://www.youtube.com/watch?time_continue=182&v=dz59GsdvUF8

# Steps to run this example

1. Git clone this repo
    * `git clone git@github.com:applitools/tutorial-selenium-ruby-basic.git`
2. Open the folder `tutorial-selenium-ruby-basic`
3. Run command `gem install bundler && bundle install`. This will install necessary ruby gems and dependencies
4. Obtain your API_KEY:
    * Login to Applitools > Click on the Person icon > My API Key
5. Export the API_KEY: 
    * Don't forget to change the example with your own API key
    * Set the environment variable which would be used in the test: 
         * For Mac, Linux: `export APPLITOOLS_API_KEY=MY_API_KEY`
         * For Windows: `SET APPLITOOLS_API_KEY=MY_API_KEY`
6. Run the test: `bundle exec ruby simple_test_script.rb`
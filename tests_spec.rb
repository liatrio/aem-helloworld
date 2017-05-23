require 'headless'
require 'selenium-webdriver'
require 'minitest/autorun'

describe 'Petlinic' do
  before do
    @headless = Headless.new
    @headless.start

    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to 'http://aem:4502/content/helloworld.html'
    @driver.manage.timeouts.implicit_wait = 30
  end

  after do
    @headless.destroy
  end

  describe 'when homepage is available' do
    it 'should show correct page title' do
      puts @driver.title
      assert @driver.title == 'Hello World'
    end
  end

end

require 'headless'
require 'selenium-webdriver'
require 'minitest/autorun'

describe 'Petlinic' do
  before do
    @headless = Headless.new
    @headless.start

    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 30
    @driver.navigate.to 'http://aem:4502/content/helloworld.html'
    @driver.find_element(:id, 'username').send_keys('admin')
    @driver.find_element(:id, 'password').send_keys('admin')
    @driver.find_element(:id, 'submit-button').click
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

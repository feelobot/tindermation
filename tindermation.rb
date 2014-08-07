require 'rubygems'
require 'appium_lib'
require 'nokogiri'
require 'open-uri'

if ENV['SAUCE']
  capabilities = {
    'appium-version'=> '1.0',
    'platformName'=> 'Android',
    'platformVersion'=> '4.4',
    'deviceName'=> 'Android Emulator',
    'app'=> 'sauce-storage:tinder.apk.zip',
    'appPackage' => 'com.tinder',
    'appActivity' => 'com.tinder.activities.ActivitySplashLoading_',
    'name' => "Tindermation",
    'locationServicesEnabled' => true
  }
  server_url = "http://0.0.0.0:4723/wd/hub"
  Appium::Driver.new(caps: capabilities).start_driver
else
  capabilities = {
    'appium-version'=> '1.0',
    'platformName'=> 'Android',
    'platformVersion'=> '4.4',
    'deviceName'=> '10.0.0.2:5555',
    'device' => 'android',
    'app' => '/Path/to/tinder.apk',
    'app-package' => 'com.tinder',
    'app-activity' => 'com.tinder.activities.ActivitySplashLoading_'
  }

  Appium::Driver.new("appium_lib" => {
      "server_url" => "http://localhost:4723/wd/hub"
    },caps: capabilities).start_driver
end

Appium.promote_appium_methods Object

def get_corny_joke
  page = Nokogiri::HTML(open("http://www.pickuplinegenerator.com/"))
  page.css("h2").text
end

def like_button
  find_element(:name, "like_button")
end

def send_message(text)
  find_element(:xpath, "//android.view.View[1]/android.support.v4.view.ViewPager[1]/android.widget.EditText[1]").send_keys(text)
  driver.execute_script 'mobile: tap', :x => 716, :y => 577, :fingers => 1, :tapCount => 1, :duration => 0.5
end

def matches?
  exists { find_element(:name, "Matched on").click } ? false : true
end

def click_msgs_btn
  find_element(:xpath, "//android.view.View[1]/android.support.v4.view.ViewPager[1]/android.widget.RelativeLayout[1]/android.widget.ImageButton[4]").click
end

def go_to_tinder_home
  driver.execute_script 'mobile: tap', :x => 105, :y => 116, :fingers => 1, :tapCount => 1, :duration => 0.5
end

i=0
while true do
  begin
    puts "Looking for girls to match..."
    like_button.click
    puts "Liked Girl #: #{i+=1}"
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts "#############################################"
    puts "NO MORE GIRLS :("
    puts "CHECKING MESSAGES"
    puts "#############################################"
    click_msgs_btn
    begin
      match = text("Matched on")
      match.click
      send_message(get_corny_joke)
      go_to_tinder_home
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "#############################################"
      puts "NO MORE MATCHES :("
      puts "#############################################"
      go_to_tinder_home
    end
  end
end
driver_quit



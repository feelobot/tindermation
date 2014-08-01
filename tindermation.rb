require 'rubygems'
require 'appium_lib'

 capabilities = {
    'appium-version'=> '1.0',
    'platformName'=> 'Android',
    'platformVersion'=> '4.4',
    'deviceName'=> '00810f26d8c8f746',
    'device' => 'android',
    'app' => 'PATH/TO/TINDER.apk',
    'app-package' => 'com.tinder',
    'app-activity' => 'com.tinder.activities.ActivitySplashLoading_'
  }

  Appium::Driver.new("appium_lib" => {
      "server_url" => "http://localhost:4723/wd/hub"
    },caps: capabilities).start_driver
end

1000.times do |i|
  puts "Like Number: #{i}"
  find_element(:name, "like_button").click
end

driver_quit

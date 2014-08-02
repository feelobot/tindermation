tindermation
==========
## Description
This tool is an automated script for swiping right on every single tinder user that it encounters. I just made it as a proof of concept to my friends on how I can tinder while sleeping if I wanted to.

Video of it in action:

[![Tindermation](http://img.youtube.com/vi/Kj3p1tfjKiQ/0.jpg)](http://www.youtube.com/watch?v=Kj3p1tfjKiQ)

## How to use:
First off this is only working on android phones because they behave better on real devices but you can easily do this in the cloud on iOS devices and even mock your geolocation to anywhere you like.
if you don't have it already:
```
brew install npm
```
You will also need the android developers toolkit: http://developer.android.com/sdk/index.html
and follow the steps to setup android here: http://appium.io/slate/en/tutorial/android.html?ruby#toc_12


Then install appium (tool for automating mobile devives) and run it
```
npm install appium -g 
appium &
```

You can download tinder from any trustworthy site: http://www38.zippyshare.com/d/75420186/46934/com.tinder-3.2.0-APK4Fun.com.apk
or use an apk extractor to get it from your phone

clone this repo
```ruby
bundle
ruby tindermation.rb
```

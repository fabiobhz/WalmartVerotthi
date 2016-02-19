#encoding: UTF-8

require 'capybara/cucumber'
require "selenium-webdriver"
require 'watir'
require 'rubygems'
require 'test-unit'
require 'capybara/rspec'
require 'capybara-page-object'


Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 20
Capybara.javascript_driver = :webkit
javascript_driver = Symbol

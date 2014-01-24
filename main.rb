require_relative 'database.rb'
require 'rubygems'
require 'pry'
require "colorize"
require_relative 'contact'
require_relative 'application'
 
Application.new.run  # happening on the instance of an applicaton (instance level)
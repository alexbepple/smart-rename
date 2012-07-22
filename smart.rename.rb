#!/usr/bin/env ruby

project_dir = File.dirname(File.realpath(__FILE__))
$LOAD_PATH.unshift File.join(project_dir, 'lib')

require 'name'

ARGV.each do |original_name|
  new_name = Name.new(original_name).clean
  puts "#{original_name} => #{new_name}"
  File.rename original_name, new_name
end

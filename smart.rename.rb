#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(File.realpath(__FILE__))

require 'name'

original_name = ARGV.shift
new_name = Name.new(original_name).clean
File.rename original_name, new_name

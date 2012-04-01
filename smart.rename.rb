#!/usr/bin/env ruby

project_dir = File.dirname(File.realpath(__FILE__))
$LOAD_PATH.unshift File.join(project_dir, 'lib')

require 'name'

original_name = ARGV.shift
new_name = Name.new(original_name).clean
File.rename original_name, new_name

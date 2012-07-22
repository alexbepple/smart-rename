# encoding: utf-8

require 'name'

describe 'Smart renamer' do
  data = [
    'preserves good names: foo (1981)  bar',
  ]
  data.each do |datum|
    description, example, expectation = datum.split ': '
    it description do
      Name.new(example).clean.should == (expectation || 'foo (1981)  bar')
    end
  end
end

describe 'Title' do
  titles = {
    'foo - foo bar' => 'foo bar',
    'foo - foo ' => 'foo',
  }
  titles.each do |name, title|
    it "Title of ‘#{name}’: #{title}" do
      Name.new(name).title.should == title
    end
  end
end

describe 'Author' do
  authors = {
    'foo' => 'foo',
    'foo, bar' => 'foo, bar',
    'foo bar' => 'foo bar',
    'fóo' => 'fóo',
    'foo 0000 bar' => 'foo', #Year not enclosed
  }
  authors.each do |name, author|
    it "of ‘#{name}’: #{author}" do
      Name.new(name).author.should == author
    end
  end
end

describe 'Year' do
  years = {
    'foo - bar [1981]' => '1981',
    'foo - bar' => '',
  }
  years.each do |name, year|
    it "Year of ‘#{name}’: #{year}" do
      Name.new(name).year.should == year
    end
  end
end

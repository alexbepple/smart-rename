require './name'

describe 'Smart renamer' do
  data = [

    'preserves good names: foo (1981)  bar',
    'allows for spaces in author names: foo bar (1981)  bar: foo bar (1981)  bar',
    'allows for spaces in title: foo (1981)  foo bar: foo (1981)  foo bar',
    'allows for multiple authors: foo, bar (1981)  bar: foo, bar (1981)  bar',
    'reformats year when components already in right order: foo [1981] bar',

  ]
  data.each do |datum|
    description, example, expectation = datum.split ': '
    it description do
      Name.new(example).clean.should == (expectation || 'foo (1981)  bar')
    end
  end
end

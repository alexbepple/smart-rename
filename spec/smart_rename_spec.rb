require './name'

describe 'Smart renamer' do
  data = [

    'preserves good names: foo (1981)  bar',
    'reformats year when components already in right order: foo [1981] bar',

  ]
  data.each do |datum|
    description, example = datum.split ': '
    it description do
      Name.new(example).clean.should == 'foo (1981)  bar'
    end
  end
end

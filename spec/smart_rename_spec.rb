require './rename'

describe 'Smart renamer' do
  it 'preserves a good name' do
    good_name = 'foo (1981)  bar'
    Name.new(good_name).clean.should == good_name
  end
  it 'reformats the year when the components are in the right order' do
    good_name = 'foo (1981)  bar'
    Name.new('foo [1981] bar').clean.should == good_name
  end
end

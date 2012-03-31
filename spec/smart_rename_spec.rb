require './rename'

describe 'Smart renamer' do
  it 'preserves a good name' do
    good_name = 'foo (1981)  bar'
    rename(good_name).should == good_name
  end
  it 'reformats the year when the components are in the right order' do
    good_name = 'foo (1981)  bar'
    rename('foo [1981] bar').should == good_name
  end
end

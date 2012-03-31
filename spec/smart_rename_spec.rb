
require './rename'

describe 'Smart renamer' do
  it 'preserves a good name' do
    good_name = 'foo (1981)  bar'
    rename(good_name).should == good_name
  end
end

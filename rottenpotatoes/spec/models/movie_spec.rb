require 'spec_helper'
describe Movie do
  fixtures :movies
  it 'should include the director name'do
    movie = movies(:fake_movie)
    movie.director.should == 'FakeDirector'
  end
end
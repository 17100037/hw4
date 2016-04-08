require 'spec_helper'

describe MoviesController do
  
  describe 'same director movie list (exists)' do
    before :each do
      @fake_result = mock("FakeMovie", :id => "1", :title => "FakeMovie", :director => "FakeDirector")
      Movie.stub(:find).and_return(@fake_result)
    end
    
    it 'should go to the page having movies with same directors' do
      get :directors, {:id => "1"}
      response.should render_template('directors')
    end
  end
  
  
  describe 'same director movie list (does not exist)' do
    before :each do
      @fake_result = mock("FakeMovie", :id => "1", :title => "FakeMovie", :director => nil)
      Movie.stub(:find).and_return(@fake_result)
    end
    
    it 'should go to the home page' do
      get :directors, {:id => "1"}
      response.should redirect_to(movies_path)
    end
  end
end
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/volleys/new.html.erb" do
  include VolleysHelper
  
  before(:each) do
    assigns[:volley] = stub_model(Volley,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/volleys/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", volleys_path) do
    end
  end
end



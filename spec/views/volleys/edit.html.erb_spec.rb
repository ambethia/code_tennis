require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/volleys/edit.html.erb" do
  include VolleysHelper
  
  before(:each) do
    assigns[:volley] = @volley = stub_model(Volley,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/volleys/edit.html.erb"
    
    response.should have_tag("form[action=#{volley_path(@volley)}][method=post]") do
    end
  end
end



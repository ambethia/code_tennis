require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/avatars/new.html.erb" do
  include AvatarsHelper
  
  before(:each) do
    assigns[:avatar] = stub_model(Avatar,
      :new_record? => true,
      :name => "value for name",
      :color => "value for color",
      :filename => "value for filename"
    )
  end

  it "should render new form" do
    render "/avatars/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", avatars_path) do
      with_tag("input#avatar_name[name=?]", "avatar[name]")
      with_tag("input#avatar_color[name=?]", "avatar[color]")
      with_tag("input#avatar_filename[name=?]", "avatar[filename]")
    end
  end
end



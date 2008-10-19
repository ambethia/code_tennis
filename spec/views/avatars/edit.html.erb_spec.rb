require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/avatars/edit.html.erb" do
  include AvatarsHelper
  
  before(:each) do
    assigns[:avatar] = @avatar = stub_model(Avatar,
      :new_record? => false,
      :name => "value for name",
      :color => "value for color",
      :filename => "value for filename"
    )
  end

  it "should render edit form" do
    render "/avatars/edit.html.erb"
    
    response.should have_tag("form[action=#{avatar_path(@avatar)}][method=post]") do
      with_tag('input#avatar_name[name=?]', "avatar[name]")
      with_tag('input#avatar_color[name=?]', "avatar[color]")
      with_tag('input#avatar_filename[name=?]', "avatar[filename]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/commits/edit.html.erb" do
  include CommitsHelper
  
  before(:each) do
    assigns[:commit] = @commit = stub_model(Commit,
      :new_record? => false,
      :message => "value for message"
    )
  end

  it "should render edit form" do
    render "/commits/edit.html.erb"
    
    response.should have_tag("form[action=#{commit_path(@commit)}][method=post]") do
      with_tag('textarea#commit_message[name=?]', "commit[message]")
    end
  end
end



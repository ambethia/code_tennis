require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/commits/new.html.erb" do
  include CommitsHelper
  
  before(:each) do
    assigns[:commit] = stub_model(Commit,
      :new_record? => true,
      :message => "value for message"
    )
  end

  it "should render new form" do
    render "/commits/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", commits_path) do
      with_tag("textarea#commit_message[name=?]", "commit[message]")
    end
  end
end



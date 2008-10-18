require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/commits/index.html.erb" do
  include CommitsHelper
  
  before(:each) do
    assigns[:commits] = [
      stub_model(Commit,
        :message => "value for message"
      ),
      stub_model(Commit,
        :message => "value for message"
      )
    ]
  end

  it "should render list of commits" do
    render "/commits/index.html.erb"
    response.should have_tag("tr>td", "value for message", 2)
  end
end


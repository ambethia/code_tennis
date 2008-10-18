require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/commits/show.html.erb" do
  include CommitsHelper
  
  before(:each) do
    assigns[:commit] = @commit = stub_model(Commit,
      :message => "value for message"
    )
  end

  it "should render attributes in <p>" do
    render "/commits/show.html.erb"
    response.should have_text(/value\ for\ message/)
  end
end


require 'spec_helper'
describe "The CVE-2013-4413 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::CVE_2013_4413.new
		# @check.debug = true
	end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"wicked", :version=>"1.0.0"}]
    @check.vuln?.should   be_true
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"wicked", :version=>"1.0.1"}]
    @check.vuln?.should   be_false
  end
end
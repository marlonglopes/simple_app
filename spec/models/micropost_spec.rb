require 'spec_helper'

describe Micropost do


	before(:each) do
		@user = Factory(:user)
		@attr = { :content => "value for content" }
	end

	it "should create a new instance given valid attributes" do
		Micropost.create!(@attr)
	end

	describe "user associations" do

		before(:each) do
			@micropost = @user.microposts.create(@attr)
		end
		
		it "should have a user attribute" do
			@micropost.should respond_to(:user)
		end

		it "should have the right associated user" do
			@micropost.user_id.should == @user.id
			@micropost.user.should == @user
		end

		it "should destroy associated microposts" do
			@user.destroy
			[@mp1, @mp2].each do |micropost|
#				Micropost.find_by_id(micropost.id).should be_nil
				lambda do
					Micropost.find(micropost.id)
				end.should raise_error(ActiveRecord::RecordNotFound)
			end
		end
	end

	describe "validations" do

		it "should require a user id" do
			Micropost.new(@attr).should_not be_valid
		end

		it "should require nonblank content" do
			@user.microposts.build(:content => " ").should_not be_valid
		end

		it "should reject long content" do
			@user.microposts.build(:content => "a" * 141).should_not be_valid
		end

	end

end

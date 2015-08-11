require 'spec_helper'
 
describe Quiz do
 
	before :each do
	    @quiz = Quiz.new(3)
	end

	describe "#new" do
	    it "takes a single parameter and returns a Quiz object" do
	        @quiz.should be_an_instance_of Quiz
	    end
	end

end
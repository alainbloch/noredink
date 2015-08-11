require 'spec_helper'
 
describe Quiz do
 
	before :each do
    @length = 3
	  @quiz = Quiz.new(@length)
	end

	describe "#new" do
	 it "takes a single parameter and returns a Quiz object" do
	   @quiz.should be_an_instance_of Quiz
	 end
	end

  describe "#length" do
    it "is equal to the argument passed in" do
      @quiz.length.should equal(@length)
    end

    it "can be overwritten" do
      new_length = 5
      @quiz.length = new_length
      @quiz.length.should equal(new_length)
    end
  end

end
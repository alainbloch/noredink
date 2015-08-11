require 'spec_helper'
 
describe Quiz do
 
	before :each do
    @length = 3
	  @quiz = Quiz.new(@length)
	end

	describe "#new" do
	 it "takes a single parameter and returns a Quiz object" do
	   @quiz.should be_an_instance_of(Quiz)
	 end

    it "errors if the parameter is less than zero" do
      expect { Quiz.new(-1) }.to raise_error
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

  describe "#questions" do

    it "has a list of questions" do
      @quiz.questions.should_not be_nil
      @quiz.questions.should be_an_instance_of(Array)
    end

  end

  describe "#usage" do

    it "has a list of usage data" do
      @quiz.usage.should_not be_nil
      @quiz.usage.should be_an_instance_of(Array)
    end

  end

  describe "#generate" do

    it "returns a list of question ids that is equal in the length" do
      question_ids = @quiz.generate
      question_ids.should be_an_instance_of(Array)
    end

  end


end
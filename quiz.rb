# noredink quiz 
require 'csv'

class Quiz
  attr_accessor :length, :questions, :usage

  def initialize(length)
    @length = length
    @questions = Array.new
    @usage = Array.new
    check_length
    load_questions
    load_usage
  end	

  def load_questions
    csv = CSV.read('questions.csv', headers: true)
    csv.each {|row| @questions << row.to_hash }
  end

  def load_usage
    csv = CSV.read('usage.csv', headers: true)
    csv.each {|row| @usage << row.to_hash }
  end

  def check_length
    return if @length.is_a?(Integer) && @length > 0
    raise 'length must be an integer greater than 0'
  end

  def generate
    # lets make a pool of all the questions
    question_pool = @questions.clone
    # questions that we are generating
    quiz_questions = []
    # get questions that students have already been assigned
    previous_questions = @usage.map{|r| r['question_id'] }.uniq
    # we are going to eliminate these questions from the pool
    question_pool.delete_if{|question| previous_questions.include?(question['question_id'])}
    # go over the question pool and pick out some questions
    index_range = (0..(question_pool.size - 1))
    @length.times do |i|
      quiz_questions << question_pool[rand(index_range)]
    end
    quiz_questions.sort!{|a,b| a['difficulty'].to_f <=> b['difficulty'].to_f }
    return quiz_questions.map{|q| q['question_id']}
  end


end
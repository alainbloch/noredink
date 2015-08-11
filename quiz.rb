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

  end

end
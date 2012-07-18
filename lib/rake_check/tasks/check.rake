# encoding: UTF-8
require 'rake_check/rbp_checker'
require 'rake_check/rspec_checker'
require 'rake_check/reek_checker'
require 'rake_check/yard_checker'
require 'rake_check/cane_checker'
require 'rake_check/cucumber_checker'
require 'rake_check/brakeman_checker'
require 'rake_check/coffee_lint_checker'
##
# Do exakt what it is called
#
# @param [String] string The string to print
# @author dmasur
def puts_unless_empty(string)
  puts string unless string.empty?
end

##
# Print the check results
#
# @param [Array / Hash] results Array of Results or Hashresult
# @author dmasur
def print_check_result(results)
  print_outputs results
  print_summary results
end

##
# Print Outputs of each result
#
# @author dmasur
def print_outputs(results)
  results.each do |result|
    puts_unless_empty result[:check_output]
  end
end

##
# Print Summary of all Outputs
#
# @author dmasur
def print_summary(results)
  result = results.map do |result|
    "#{result[:type]}§#{result[:status]}"
  end
  puts `echo "#{result.join("\n")}" | column -t -s§`
end

desc "Check all Metric tools"
task :check do
  results  ||= []
  puts "[1/8] Testing Cucumber ..."
  results << CucumberChecker.new.result
  puts "[2/8] Testing RSpec ..."
  Dir["spec*"].each do |spec_dir|
    results << RspecChecker.new.result(spec_dir)
  end
  puts "[3/8] Testing Rails Best Practices ..."
  results << RbpChecker.new.result
  puts "[4/8] Testing Yard ..."
  results << YardChecker.new.result
  puts "[5/8] Testing Reek ..."
  results << ReekChecker.new.result
  puts "[6/8] Testing Cane ..."
  results << CaneChecker.new.result
  puts "[7/8] Testing Brakeman ..."
  results << BrakemanChecker.new.result
  puts "[8/8] Testing CoffeLint ..."
  results << CoffeeLintChecker.new.result
  print_check_result results
end

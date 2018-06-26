require_relative '../../lib/sources/classA.rb'
require_relative '../../lib/sources/classB.rb'
require 'rspec'
require 'plist'

Given("I read in {string} from {string} directory") do |project, dir|
  @objB = ClassB.new
  @objB.readProject(dir, project)
end

Given("I make a ClassA object") do
  @obj = ClassA.new
end

When("I call loadVals") do
  @obj.loadVals("test.json")
  # @obj.printVals
end

When("I call loadVals with {string}") do |string|
  @obj.loadVals(string)
end

When("I bump the build number from {string}") do |string|
  expect(@objB.buildNumber).to eq(string)
  @objB.bumpBuildNum
end

Then("Its build number should be {string} at plist path {string}") do |string, string2|
  plist = Plist.parse_xml string2
  expect(plist["CFBundleVersion"]).to eq(string)
end

Then("x should be {int}") do |int|
  expect(@obj.x).to eq(int)
end

Then("y should be {string}") do |string|
  expect(@obj.y).to eq(string)
end

Then("z should be {string}") do |string|
  expect(@obj.z).to eq(string)
end

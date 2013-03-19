require_relative "../lib/fork_pool"

describe ForkPool do

	describe ".new" do
		subject { ForkPool }
			it("should not accept negative numbers") { lambda { subject.new(-1) }.should raise_error }
			it("should not accept an empty pool") { lambda { subject.new(0) }.should raise_error }
			it("should accept a positive number of forks") { lambda { subject.new(1) }.should_not raise_error }
		end

		describe "#empty?" do
			subject { ForkPool }
			it("2 in the pool should not feel empty") { subject.new(2).empty?.should be_false }
			it("1 in the pool is lonely but not empty") { subject.new(1).empty?.should be_false }

			it("none in the pool is empty") do
				pending "the constructor won't allow this"
				subject.new(0).empty?.should be_true 
			end

			it("negative numbers in the pool? are these forks made of antimatter") do
				pending "of course, the constructor complains about the negative number"
				subject.new(-1).empty?.should be_true
			end
		end


	describe "#pool" do
		subject { ForkPool.new(3) }
		its(:pool) { should == 3 }
	end

	describe "#spork" do
		subject { ForkPool.new(2) }
		pending("right... how does one test such a thing?")
	end

	describe "#wait" do
		subject { ForkPool.new(2) }
		pending("ehm...?")
	end
end

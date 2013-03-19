require_relative "../lib/fork_pool"

puts "Hey #{Process.pid}"

pool = ForkPool.new(2)
8.times do
	pool.spork do
		sleep 0.3
		puts "Ho! #{Process.pid}"
	end
end

pool.wait

puts "The End #{Process.pid}"
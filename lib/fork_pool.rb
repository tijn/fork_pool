# a pool filled with pointy forks
class ForkPool
  attr_reader :pool

  # we keep a count of the amount of "forks in the pool" that we may use to fork processes of
  def initialize(size = 2)
    raise ArgumentError if size < 1
    @pool = size
  end

  # fork off a block (blocking)
  #
  # if the pool is empty, it will wait for a process to die, spoon it up, and then fork anyway
  def spork(&block)
    if empty?
      wait && fork_off(&block)
    else
      fork_off(&block)
    end
  end

  def empty?
    @pool < 1
  end

  # it waits until a child process dies
  # 
  # returns the number of forks in the pool
  def wait
    puts "waiting... (#{pool})"
    if pid_done = Process.wait
      @pool += 1
    end
    @pool
  end

private

  # just fork regardless of how many forks we have in the pool
  def fork_off(&block)
    puts "forking... (#{pool})"
    @pool -= 1
    fork(&block)
  end

end

fork_pool
=========

A pool that contains a number of forks. The pool can use this cutlery to fork off code blocks.

What?
-----

Yeah, so, I was just reading about processes and forking in Ruby and then I decided I would learn more by actually
writing a small library. This is it.

Usage
-----

```ruby
pool = ForkPool.new(4) # max 4 childs processes at a time

# #spork forks off a block of code and also spoons up finished processes.
pool.spork do
  do_something_impressive_that_needs_multiple_processors!
end

pool.wait # optional, you may opt to let the parent process die before its childs. Your choice.

puts "done!"
```

Known issues
------------

```ForkPool#wait``` will wait for ANY child process to die even if it was started by another pool.

Really, if you try to us this code with multiple pools (that have processes running at the same time) you will be asking for trouble.

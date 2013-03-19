fork_pool
=========

A pool that can keep a number of forks. It uses these to fork off code blocks.

What?
-----

Yeah, so, I was just reading about processes and forking in Ruby and then I decided I would learn more by actually
writing a small library. This is it.

Usage
-----

```ruby
pool = ForkPool.new(4) # max 4 childs processes at a time
pool.spork do
  do_something_impressive_that_needs_multiple_processors!
end

pool.wait # optional, you may opt to let the parent process die before its childs. Your choice.

puts "done!"
```

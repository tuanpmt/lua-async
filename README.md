# lua-async
This is Async utilities for lua with similar functional: https://github.com/caolan/async

###Control Flow

* [`waterfall`](#waterfall)




<a name="waterfall" />
### waterfall(tasks, [callback])

Runs the `tasks` array of functions in series, each passing their results to the next in
the array. However, if any of the `tasks` pass an error to their own callback, the
next function is not executed, and the main `callback` is immediately called with
the error.

__Arguments__

* `tasks` - An array of functions to run, each function is passed a 
  `callback(err, result1, result2, ...)` it must call on completion. The first
  argument is an error (which can be `nil`) and any further arguments will be 
  passed as arguments in order to the next task.
* `callback(err, [results])` - An optional callback to run once all the functions
  have completed. This will be passed the results of the last task's callback.



__Example__

```lua
async.waterfall({
    function (callback)
        callback(nil, "one", "two");
    end,
    function (callback, arg1, arg2)
    	--arg1 now equals "one" and arg2 now equals "two"
    	print(arg1, arg2)
        callback(nil, "three");
    end,
    function(callback, arg1)
        --arg1 now equals "three"
        print(arg1)
        callback(nil, "done");
    end
}, function (err, result)
   -- result now equals "done"
   print(result)
end);
```

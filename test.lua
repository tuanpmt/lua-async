async = require("async")
async.waterfall({
    function (callback)
        callback(null, "one", "two");
    end,
    function (callback, arg1, arg2)
    	--arg1 now equals "one" and arg2 now equals "two"
    	print(arg1, arg2)
        callback(null, "three");
    end,
    function(callback, arg1)
        --arg1 now equals "three"
        print(arg1)
        callback(null, "done");
    end
}, function (err, result)
   -- result now equals "done"
   print(result)
end);
local M = {}
function M.waterfall(task, cb)
	local nextArg = {}
	for i, v in pairs(task) do
		local error = false
		v(function(err, ...)
			local arg = {...}
		    nextArg = arg;
		    if err then
				error = true
			end
		end, unpack(nextArg))
		if error then return cb("error") end
		cb(nil, unpack(nextArg))
	end
end


return M
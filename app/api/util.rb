module Util
    class Result
	def self.success
	    {result: "success"}
	end

	def self.error(msg)
	    {result: "fail", msg: msg}
	end
    end
end

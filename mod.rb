#!/usr/bin/env ruby

Dir['./lib/converters/*.rb'].each do |c|
	
	tmp = ['module Convert']
	f = File.readlines(c)
	f.each do |line|
		tmp << "  #{line}"
	end
	tmp << 'end'
	
	File.open(c, 'w'){|f| f.write(tmp.join)}
end

#!/usr/bin/env ruby


files = `ls`.split("\n").select{|x| x =~ /html|txt/ }

files.each do |x|
  `mv "#{x}" "#{x}_"`
  `iconv -f SHIFT-JIS -t UTF8 "#{x}_" > "#{x}"`
end

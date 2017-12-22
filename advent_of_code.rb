#!/usr/bin/env ruby

Dir["./lib/*.rb"].each do |path|
  require path
  day = File.basename(path, ".rb")
  classname = day.capitalize
  klass = Object.const_get(classname)
  input_file = File.join("input", "#{day}_input.txt")
  input = File.read(input_file).strip
  puts "= #{classname}"
  puts klass.run(input)
end

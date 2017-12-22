#!/usr/bin/env ruby

class AdventOfCode
  def self.run_all()
    Dir["./lib/day*.rb"].each do |path|
      day = File.basename(path, ".rb").gsub("day","")
      self.run_day(day)
    end
  end

  def self.run_day(day)
    self.run(day, 1)
    self.run(day, 2)
  end

  def self.run(day, part)
    input_filename = File.join("input", "day#{day}_input.txt")
    input = File.read(input_filename).strip
    class_filename = File.join("lib", "day#{day}.rb")
    require_relative class_filename
    klass = Object.const_get("Day#{day}")
    method = "part#{part}"
    puts "= Day #{day}, Part #{part}:"
    if klass.respond_to? method
      puts klass.send(method, input)
    else
      puts "Not yet implemented"
    end
  end
end

if ARGV.empty?
  AdventOfCode.run_all
else
  AdventOfCode.run(ARGV[0], ARGV[1])
end

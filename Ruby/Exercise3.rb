=begin
Exercise Day Three:

Modify the CSV application to support an each method to return a CsvRow 
object. Use method_missing on that CsvRow to return the value for the 
column for a given heading.

For example, for the rubycsv.txt file allow an API that works like this:

csv = RubyCsv.new
csv.each {|row| puts row.one }

which should print everything in the first column
=end

# Acts As CSV Module
module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
            end
        end

        def each
            @csv_contents.each { |row| yield row }
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end
    end
end

class CsvRow
    attr_accessor :headers, :row

    def initialize(headers, row)
        @headers = headers
        @row = row
    end

    def method_missing name, *args
        header = name.to_s                
        index = @headers.index(header)
        @row[index]
    end
end

class RubyCsv # no inheritance, just mixing in the code above
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
puts "Column One"
m.each { |row| puts row.one }
puts "Column Two"
m.each { |row| puts row.two }
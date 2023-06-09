#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
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
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        csv_row = CsvRow.new(@headers, row)
        block.call csv_row
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class CsvRow
  def initialize(headers, values)
    @headers = headers
    @values = values
  end

  def method_missing(name, *args)
    idx = @headers.index name.to_s
    @values[idx]
  end
end
class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
puts "headers: #{csv.headers.inspect}"
puts "content: #{csv.csv_contents.inspect}"
csv.each { |row| puts row.one }
csv.each { |row| puts row.two }
csv.each { |row| puts row.four }
csv.each { |row| puts row.three }

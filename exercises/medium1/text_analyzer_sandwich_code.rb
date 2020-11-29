class TextAnalyzer
  def process
    File.open('sample_text.txt', 'r') { |f| yield(f.to_a) }
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.count("\n") + 1 } paragraphs" }
analyzer.process { |text| puts "#{text.size} lines" }
analyzer.process do |text|
  words = text.map { |line| line.split.size }.sum
  puts "#{words} words"
end

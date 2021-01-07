class TextAnalyzer
  def process
    File.open('sample_text.txt') { |f| yield(f) }
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.read.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.readlines.size} lines" }
analyzer.process { |file| puts "#{file.read.split.size} words" }

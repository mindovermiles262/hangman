# Create Dictionary with words between 4 and 16 chars
dict = []
File.open("dictionary.txt").each do |line|
    if line.strip.length.between?(4, 16)
        dict << line.strip
    end
end
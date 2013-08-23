@word = "This is a test" # simple game, always uses the same word/phrase

puts "Welcome to Hangman Basic 0.9\n\n"
puts "Enter 'quit' to end the game at any time\n\n"
puts "Type in a letter to guess the following word or phrase\n\n"

@guessed_letters = []

def hide_letters
	revealed = ""
	@word.each_char.each do |char|
		if @guessed_letters.include?(char.downcase) || !char.match(/[a-zA-Z]/)
			revealed += char
		else
			revealed += '_'
		end
	end
	revealed
end

revealed = hide_letters
exited = false

while @word != revealed do

	puts "Word: #{revealed}"
	print 'Guess: '
	guess = gets.chomp.downcase

	if %w(exit quit leave close).include? guess
		exited = true
		break;

	elsif guess.length > 1
		puts "Please enter just a single letter at a time"

	elsif !guess.match(/[a-z]/)
		puts "Please enter letters only"

	elsif @guessed_letters.include? guess
		puts "You already guessed '#{guess}'"

	else
		@guessed_letters << guess
		puts @word.downcase.include?(guess) ? "Good guess!" : "Sorry, wrong letter"

	end

	revealed = hide_letters

end

puts "You got it!" unless exited

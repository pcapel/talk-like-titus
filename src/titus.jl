module titus
using Random

mersenne = MersenneTwister(12346)
# [(char, weight)]
sparkle_chars = ['*', '*', '*', '~', '~', '~', '~', '~', '(',  ')']

# he's a dog, so food emoji right?
food_emoji = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🥭", "🍍",
							"🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌽", "🥕", "🧄", "🧅", "🥔", "🍠",
							"🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🥚", "🍳", "🧈", "🥞", "🧇", "🥓", "🥩", "🍗",
							"🍖", "🦴", "🌭", "🍔", "🍟", "🍕", "🥪", "🥙", "🧆", "🌮", "🌯", "🥗", "🥘", "🥫",
							"🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥟", "🦪", "🍤", "🍙", "🍚", "🍘", "🍥", "🥠",
							"🥮", "🍢", "🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫",
							"🍿", "🍩", "🍪", "🌰", "🥜", "🍯", "🥛", "🍼", "☕️", "🍵", "🧃", "🥤", "🍶", "🍺",
							"🍻", "🥂", "🍷", "🥃", "🍸", "🍹", "🧉", "🍾", "🧊", "🥄", "🍴", "🥣", "🥡", "🥢",
							"🧂"]

function random_bool()
	n = rand(1)[1]
	n > 0.5
end

function randomize_upper(s)
	k = ""
	for char in s
		if random_bool()
			k *= uppercase(char)
		else
			k *= char
		end
	end
	return k
end

function rand_between(lower, upper)
	n = floor(rand(1)[1] * upper)
  while n > upper || n < lower
		n = floor(rand(1)[1] * upper)
	end
	return n
end

function get_random(arr)
	rand(mersenne, arr, 1)[1]
end

function random_emoji(str)
	period = r"\."
	s = str
	while !isnothing(match(period, s))
		replacement = get_random(food_emoji)
		s = replace(s, "."=>replacement, count=1)
	end
	s
end

function sparklez()
	sparkle_length = rand_between(5, 11)
	sparkle = ""
	while sparkle_length > 0
		sparkle *= get_random(sparkle_chars)
		sparkle_length -= 1
	end
	sparkle
end

println(map(x->sparklez()*random_emoji(randomize_upper(x))*sparklez(), ARGS))

end # module

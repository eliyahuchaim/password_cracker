def test
  starting_point = 0
  picks.each_with_index do |e,i|
    if picks[picks.length - (i + 1)] < 3
      picks[picks.length - (i + 1)] +=1
      starting_point = i
      puts "this is  #{starting_point}"
      break
    end
  end
  picks.slice!(picks.length - starting_point, picks.length)
  picks += Array.new(starting_point, 0)
  return picks
end




def crack!(picks = [0], set = 1, incrementIndex = 0)
  return "your code is: " + guess if guess == self.password

  self.guess = ''

  for n in picks
    self.guess += self.chars[n]
    puts ("the guess is " + self.guess)
  end

  if picks[0] == 5 && picks[picks.length - 1] == 5
    # TODO: set all indexs to 0 in picks
    return self.crack!(pick[picks.length] = 0 , set + 1, incrementIndex = 0)
  else
    if picks[incrementIndex] < 5
      return self.crack!(picks[incrementIndex] += 1, set, incrementIndex)
    else
      picks[set] +=1
      return self.crack!(picks[incrementIndex] = 0, set, incrementIndex)
    end
  end
end







def crack!(picks = [0], set = 1, incrementIndex = 1, baseIncrement = 2)
  return "your code is: " + guess if guess == self.password

  self.guess = ''

  for n in picks
    self.guess += self.chars[n]
    puts ("the guess is " + self.guess)
  end

  # NOTE: if the element we are incrementing is less than the max, increment it

  if picks[picks.length - incrementIndex] < 3
    picks[picks.length - incrementIndex] += 1
  else
    if picks.select {|el| el == 3}.length == set
      # NOTE: if all the elements reached max, add another one and start over
      set += 1
      picks = Array.new(set, 0)
      incrementIndex = 1
      baseIncrement = 2
    else
      if picks[baseIncrement] == 3
        baseIncrement += 1
        picks = Array.new(set, 0)
        picks[baseIncrement] +=1
      else

      end
      picks[baseIncrement] += 1
      picks[incrementIndex] = 0
    end
  end


end

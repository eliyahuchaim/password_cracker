require 'pry'


# recursive.....cant run more than 6 digits

class PasswordCracker
  attr_reader :password, :chars
  attr_accessor :guess, :stash

  def initialize(password)
    @chars = ['0','1','2','3','4','5']
    @password = password
    @guess = ''
  end

  def seePassword
    puts self.password
  end


  def crack!(picks = [0])

    return "your code is: " + guess if guess == self.password

    max = 5
    self.guess = ''

    # NOTE: construct our guess with picks indexs pulling chars out of main chars array

    for n in picks
      self.guess += self.chars[n]
      puts ("the guess is " + self.guess)
    end


    # NOTE: check to see if all indexs are maxed out, if yes, create new picks with added 0
    if picks.select {|el| el == max}.length == picks.length
      picks = Array.new(picks.length + 1, 0)
    else
      if picks[picks.length - 1] < max
        picks[picks.length - 1] +=1
      else
        starting_point = 0
        picks.each_with_index do |e,i|
          if picks[picks.length - (i + 1)] < max
            picks[picks.length - (i + 1)] +=1
            starting_point = i
            break
          end
        end
        picks.slice!(picks.length - starting_point, picks.length)
        picks += Array.new(starting_point, 0)
      end
    end
    return self.crack!(picks)
  end



end

pry.start

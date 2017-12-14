class PasswordCracker
  attr_reader :password, :chars
  attr_accessor :guess, :stash, :max

  def initialize(password)
    @chars = ('a'..'z').to_a + ('0'..'9').to_a
    @password = password
    @guess = ''
    @max = @chars.length - 1
  end

  def seePassword
    puts self.password
  end

  def start_cracking!
    n = 1
    while n < self.max
      check = self.crack! n
      return check if check != nil
      n+=1
    end
  end

  def crack! num
    picks = Array.new(num,0)

    while picks.select {|el| el == self.max}.length != picks.length
      self.guess = ''

      for n in picks
        self.guess += self.chars[n]
      end
      puts ("guessing code " + self.guess)

      # return "Code cracked with: " + self.guess if self.guess == self.password
      return [true, self.guess] if self.guess == self.password

      if picks[picks.length - 1] < self.max
        picks[picks.length - 1] +=1
      else
        starting_point = 0
        picks.each_with_index do |e,i|
          if picks[picks.length - (i + 1)] < self.max
            picks[picks.length - (i + 1)] +=1
            starting_point = i
            break
          end
        end
        picks.slice!(picks.length - starting_point, picks.length)
        picks += Array.new(starting_point, 0)
      end
    end
  end

end

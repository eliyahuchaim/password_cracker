class PasswordGenerator
  @@CHARS = ('a'..'z').to_a + ('0'..'9').to_a

  def self.create_password(length, count = 1)
    randomNumber = rand(0..@@CHARS.length - 1)
    if count == length
      return @@CHARS[randomNumber]
    end
    return @@CHARS[randomNumber] + self.create_password(length, count + 1)
  end

  def self.chars
    @@CHARS
  end


end

# puts (PasswordGenerator.createPassword(20))

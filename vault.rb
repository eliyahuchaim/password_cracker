require('./pass-generator')

class Vault

  attr_reader :name, :value, :password

  def initialize(name, value, password_length)
    @name = name
    @value = value
    @password = PasswordGenerator.create_password(password_length)
  end



end

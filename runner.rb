require('./pass-cracker')
require('./vault')

class Runner
  attr_accessor :vault, :seconds


  def seePassword
    puts self.password
  end


  def main
    self.create_vault
    self.start_cracking_dem_password_boi
  end

  def create_vault
    p "Please name your vault: "
    @vault_name = gets.chomp

    p "Insert value in your vault: "
    @value = gets.chomp.to_i
    p "value is: $#{@value}"

    p "insert length of your password"
    @length = gets.chomp.to_i

    p "Vault name is: #{@vault_name}"
    p "Value is: $#{@value}"
    p "Password length is: #{@length}"

    p "Press Y to confirm, N to start over"
    next_step = gets.chomp.downcase

    if next_step != 'y'
      return self.create_vault
    end

    self.vault = Vault.new(@vault_name, @value, @length)

    p "this is password #{self.vault.password}"

  end

  def count_down n
    return "BEGIN CRACKING" if n == 0
    p "starting in #{n}"
    sleep 1
    return count_down n - 1
  end

  def start_cracking_dem_password_boi
    count = self.count_down 3
    self.seconds = 0

    until count == "BEGIN CRACKING"
      # do nothing :)
    end

    cracker = PasswordCracker.new(self.vault.password)
    result = ''

    result_thread = Thread.new do
      result = cracker.start_cracking!
    end


    count_thread = Thread.new do
      while result[0] != true
        sleep 1
        self.seconds +=1
      end
    end

    until result[0] == true
      # keep doing noting
    end

    p "Code is: #{result[1]} and it took #{self.seconds} seconds"
  end


end


m = Runner.new
m.main

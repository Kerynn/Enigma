require 'date'

module RandomGenerator

  def characters
    ('a'..'z').to_a << ' '
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def random_num
    rand(00000...99999).to_s
  end
end

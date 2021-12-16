require './corrector'
require './rental'

class Person
  attr_accessor :id, :name, :age
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1.100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

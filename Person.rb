class Person
  attr_accessor :id, :name, :age

  def initialize(name = "Unknown", age, parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private
    def is_of_age
      return @age >= 18 ? true : false
    end

  def can_use_services
    return @age >= 18 && @parent_permission ? true : false
  end
end

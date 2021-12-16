class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(new_student)
    @students << new_student
    student.classroom = self
  end
end

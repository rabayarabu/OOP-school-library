require_relative 'person'
class Student < Person
  attr_reader :classroom
  attr_writer :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.member?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_s
    "Student: #{@name}, Age: #{@age}, Parent Permission: #{@parent_permission} ID:#{@id}"
  end
end

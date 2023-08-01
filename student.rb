require_relative 'Person'

class Student < Person
  def initialize(age, classroom, parent_permission: false, name: '')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

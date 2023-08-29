class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission: true, name: '')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

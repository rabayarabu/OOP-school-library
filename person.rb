require_relative 'nameable'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def rental(rental)
    @rentals.push(rental)
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || parent_permission

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

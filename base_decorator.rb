require_relative 'nameable'

class BaseDecorator < Nameable
  def initilize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

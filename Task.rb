#Tasks to do
class Task
  def initialize(name, description, due, priority)
    @name=name
    @description=description
    @due_date=due
    @priority=priority
    $data.push(self)
  end
  attr_reader :name
  attr_reader :description
  attr_reader :due_date
  attr_reader :priority

end

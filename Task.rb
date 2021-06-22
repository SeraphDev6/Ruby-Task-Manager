#Tasks to do
class Task
  def initialize(name, description, due, priority)
    $data.push([name, description, due, priority])
    Save()
  end
end

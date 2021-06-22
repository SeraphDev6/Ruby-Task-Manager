module Task_manager
  #Save and Load the CSV
  def Load(path="to_do_list.csv")
  $data=CSV.read(path)
  end
  def Save(path="to_do_list.csv")
    CSV.open(path,"wb") do |csv|
      #add headers
      if $data[0] !=["Name", "Description", "Due Date", "Priority"]
      csv<<["Name", "Description", "Due Date", "Priority"]
      end
      #add data
     for line in $data
       csv << line
      end
    end
  end
  #Help Menu
  def Help()
    puts "Type 'Add' to add a task"
    puts "Type 'Finish' to add a task"
    puts "Type 'List' to List all tasks"
    puts "Type 'Sort' to Sort tasks"
    puts "Type 'Details' to view a task's details"
    puts "Type 'Exit' to close the Task Log"
  end
  def Add()
    puts "What is the Task's Name?"
    name=STDIN.gets().chomp
    puts "What is the Task's Description?"
    desc=STDIN.gets().chomp
    puts "What is the date the Task is Due?"
    due=STDIN.gets().chomp
    puts "What is the Task's Priority, with 1 being highest, and 10 being lowest?"
    priority=STDIN.gets().chomp
    ntask=Task.new(name,desc,due,priority)
    puts "Task #{name} successfully added."
  end
  def Finish()
  end
  def List()
  end
  def Sort()
  end
  def Details()
  end  
end

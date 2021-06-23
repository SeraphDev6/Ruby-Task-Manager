module Task_manager
  #Save and Load the CSV
  def Load(path="to_do_list.csv")
    CSV.foreach(path,headers:true) do |row|
      ntask=Task.new(row["Name"],row["Description"],row["Due Date"],row["Priority"])
    end
  end
#----------------------------------------------------------
  def Save(path="to_do_list.csv")
    CSV.open(path,"wb") do |csv|
      #add headers
      csv<<["Name", "Description", "Due Date", "Priority"]
      #add data
     for task in $data
       csv << [task.name,task.description,task.due_date,task.priority]
      end
    end
  end
#----------------------------------------------------------
  #Help Menu
  def Help()
    puts "Type 'Add' to Add a task"
    puts "Type 'Finish' to Finish a task"
    puts "Type 'List' to List all tasks"
    puts "Type 'Sort' to Sort tasks"
    puts "Type 'Details' to view a task's Details"
    puts "Type 'Exit' to close the Task Log"
  end
#----------------------------------------------------------
  def Add()
    puts "What is the Task's Name?"
    name=STDIN.gets().chompmy
    puts "What is the Task's Description?"
    desc=STDIN.gets().chomp
    puts "What is the date the Task is Due?"
    due=STDIN.gets().chomp
    puts "What is the Task's Priority, with 1 being highest, and 10 being lowest?"
    priority=STDIN.gets().chomp
    ntask=Task.new(name,desc,due,priority)
    Save()
    puts "Task #{name} successfully added."
  end
#----------------------------------------------------------
  def Finish()
    puts "Which Task did you finish?"
    input=STDIN.gets().chomp.downcase
    if $data.any? {|task| task.name.downcase == input}
      $data.delete_if {|task| task.name.downcase == input}
      Save()
      puts "Good job completing #{input.capitalize}!" 
    elsif $data.any? {|task| task.name.downcase.include? input}
      for task_obj in $data.select {|task|  task.name.downcase.include? input}
        puts "Did you mean #{task_obj.name}?"
        puts "If so type 'y'"
        input=STDIN.gets().chomp.downcase
        if input == "y"
          $data.delete(task_obj)
          Save()
          puts "Good job completing #{task_obj.name}!"
          return
        else 
          puts "Okay.."
        end
      end
      puts "Sorry, I couldn't find that Task."
      puts "Returning to Main Menu"
    else
      puts "Hmm.. I couldn't find that task. Returning to main menu."
    end
  end
#----------------------------------------------------------
  def List()
    for task in $data
      puts task.name+"  Due By: " +task.due_date+"  Priority: "+task.priority
    end
  end
#----------------------------------------------------------
  def Sort()
    puts "What would you like to sort your tasks by?"
    puts "Type 'Name', 'Description', 'Due Date', or 'Priority'"
    input=STDIN.gets.chomp.downcase
    case input
    when "name"
      $data.sort_by!{|task| task.name.downcase}
    when "description","desc"
      $data.sort_by!{|task| task.description.downcase}
    when "due date","due","date"
      $data.sort_by!{|task| task.due_date.downcase}
    when "priority"
      $data.sort_by!{|task| task.priority.downcase}
    else 
      puts "Hmm... I'm not sure what to sort by."
      puts "Returning to Main Menu"
      return
    end
    Save()
    puts "Tasks successfully sorted by #{input.capitalize}!"
  end
#----------------------------------------------------------
  def Details()
    puts "Which Task do you want details on?"
    input=STDIN.gets().chomp.downcase
    if $data.any? {|task| task.name.downcase == input}

    elsif $data.any? {|task| task.name.downcase.include? input}
      for task_obj in $data.select {|task|  task.name.downcase.include? input}
        puts "Did you mean #{task_obj.name}?"
        puts "If so type 'y'"
        input=STDIN.gets().chomp.downcase
        if input == "y"
          puts "Task Name: "+task_obj.name
          puts "Task Description: "+task_obj.description
          puts "Task Due Date: "+task_obj.due_date
          puts "Task Priority: "+task_obj.priority
          return
        else 
          puts "Okay.."
        end
      end
    end
    puts "Sorry, I couldn't find that Task."
    puts "Returning to Main Menu"
  end  
end


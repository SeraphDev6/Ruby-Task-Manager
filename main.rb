require "csv"
require_relative "Task"
require_relative "Task_manager"
include Task_manager
#Load from CSV
$data=[]
Load()
#Show Help Menu
Help()
#Main Loop
while true
  input=STDIN.gets().chomp.downcase
  case input
    when "add"
      Add()
    when "finish"
      Finish()
    when "list"
      List()
    when "sort"
      Sort()
    when "details","detail"
      Details()
    when "help"
      Help()
    when "exit"
      Save()
      break
    else
      puts "Hmmm... I'm not sure what #{input} means..."
      puts "If you need Help, just type 'Help'"
    end
end
puts "Goodbye."

class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    self.subsalary * multiplier
  end

  def add_employee_to_list(employee)
    @employees << employee
  end

  def subsalary
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sum = sum + employee.subsalary
        sum = sum + employee.salary
      else
        sum = sum + employee.salary
      end
    end
    sum
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_employee_to_list(shawna)
darren.add_employee_to_list(david)
ned.add_employee_to_list(darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

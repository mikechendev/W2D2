require "employee"
require 'byebug'
class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise 'invalid title'
        end
    end

    def size
        @employees.count
    end

    def pay_employee(name)
        if self.funding > @salaries[name.title]
            name.pay(@salaries[name.title])
            @funding -= @salaries[name.title]
        else
            raise 'not enough funding'
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp) }
    end
    
    def average_salary
        total = 0
        @employees.each do |emp|
            total += @salaries[emp.title]
        end
        total / @employees.count
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k,v|
            @salaries[k] = v if !@salaries.keys.include?(k)
        end
        startup.employees.each { |emp| @employees << emp }
        startup.close
    end
end

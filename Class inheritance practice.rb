class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end


class Manager < Employee
    attr_reader :subordinates

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @subordinates = []
    end

    def subordinates(sub)
        @subordinates << sub
    end

    def bonus(multiplier)
        result = 0
        @subordinates.each do |sub|
            result += sub.salary
        end
        result * multiplier
    end


end
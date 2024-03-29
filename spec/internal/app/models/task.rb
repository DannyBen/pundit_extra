class Task
  TASKS = ['Task 0', 'Task 1', 'Task 2']

  attr_accessor :attributes

  class << self
    def all
      TASKS
    end

    def find(id)
      new id: id.to_i
    end
  end

  def initialize(attributes = {})
    @attributes = attributes
  end

  def id
    @attributes[:id].to_i
  end

  def subject
    attributes[:subject] ||= TASKS[id]
  end

  def to_s
    subject
  end
end

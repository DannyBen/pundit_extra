class Task
  TASKS = ['Task 0', 'Task 1', 'Task 2']

  attr_accessor :attributes

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

  def self.all
    TASKS
  end

  def self.find(id)
    Task.new id: id.to_i
  end
end

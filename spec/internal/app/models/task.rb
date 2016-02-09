class Task 
  TASKS = ["Task 0", "Task 1", "Task 2"]

  def initialize(attrs={})
    @attrs = attrs
  end

  def id
    @attrs[:id].to_i
  end

  def subject
    @subject ||= TASKS[id]
  end

  def self.all
    TASKS
  end

  def self.find(id)
    Task.new id: id.to_i
  end
end

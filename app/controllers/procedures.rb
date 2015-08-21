def list
  tasks = Task.all.order(id: :asc)
end

def add(text)
  task = Task.new(done: false, text: text)
  task.save
end

def delete(n)
  task = list[n-1]
  task.delete
end

def edit(text)
  task = list[n-1]
  task.text = text
  task.save
end

def toggle(n)
  task = list[n-1]
  task.done = !task.done
  task.save
end
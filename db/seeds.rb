# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Priorities
values = ['low', 'medium', 'high']
values.each { |value| Priority.create(name: value) }

# States
values = ['pending', 'in_progress', 'finished', 'expired']
values.each {|value| State.create(name: value)}

# ============= #
#    Lista 0    #
# ============= #
list = List.create(title: 'Lista 0')

def task_values(list, name, i)
  { list: list, state: State.all[i], priority: Priority.all[i], description: "#{name} task #{i}" }
end

3.times do |i|
  SimpleTask.create    task_values(list, 'simple', i)
  LongTask.create      task_values(list, 'long', i).merge(percentage: i*25)
  TemporaryTask.create task_values(list, 'temporary', i).merge(start_date: Date.today + i, end_date: Date.tomorrow + i*2)
end



# =================== #
#    Lista hogeraña   #
# =================== #
list = List.create(title: 'Tareas hogerañas')

low, medium, high = Priority.all
pending, finished = State.all

# Simple Tasks
SimpleTask.create(
  list: list,
  description: 'Lavar sábanas',
  state: pending,
  priority: low
)

SimpleTask.create(
  list: list,
  description: 'Cambiar foco del baño',
  state: pending,
  priority: high
)

SimpleTask.create(
  list: list,
  description: 'Regar cactus',
  state: pending,
  priority: low
)


# Long Tasks
LongTask.create(
  list: list,
  description: 'Pintar cocina',
  state: pending,
  priority: medium,
  percentage: 25
)

LongTask.create(
  list: list,
  description: 'Arreglar pérdida de la canilla del baño',
  state: finished,
  priority: low,
  percentage: 80
)


# Temporary Tasks
TemporaryTask.create(
  list: list,
  description: 'Pagar la luz',
  state: pending,
  priority: high,
  start_date: Date.today - 4,
  end_date: Date.tomorrow + 10
)

TemporaryTask.create(
  list: list,
  description: 'Terminar de comer el guiso de la heladera antes de que se pudra',
  state: pending,
  priority: high,
  start_date: Date.today - 2,
  end_date: Date.tomorrow + 2
)

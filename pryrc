load File.expand_path('~/.irbrc')
Pry::Commands.delete 'c'
Pry::Commands.delete 'n'
Pry::Commands.delete 's'
if defined?(PryDebugger) && Rails.env.test?
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

begin
  require 'awesome_print'
rescue Exception => e
  puts e
end

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    m = (obj.methods - obj.class.superclass.instance_methods).sort
    (defined? AwesomePrint) ? ap(m) : m
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.is_a?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

module Kernel
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
    str
  end

  def paste
    `pbpaste`
  end
end

def me
  User.find_by_email('u.verainf@gmail.com')
end

def r
  reload!
end

def load_irbrc(path)
  return if (path == ENV['HOME']) || (path == '/')

  irbrc = File.join(path, '.irbrc')

  load irbrc if File.exist?(irbrc)
end

load_irbrc(Dir.pwd)

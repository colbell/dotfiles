# -*- mode: ruby; -*-

#require 'rubygems'
#require 'wirble'
require 'pp'

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=1024

#Wirble.init
#Wirble.colorize

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

def irb_verbosity_toggle
  irb_context.echo ? irb_context.echo = false : irb_context.echo = true
end

# -*- mode: ruby; -*-

require 'rubygems'
#require 'wirble'
require 'pp'

IRB.conf[:AUTO_INDENT]=true

#Wirble.init
#Wirble.colorize

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end




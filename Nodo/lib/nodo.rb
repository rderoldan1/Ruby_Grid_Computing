require 'drb'
require 'active_support/all'
class Nodo
  include DRbUndumped

  def initialize
    config = get_config
    @server =  DRbObject.new_with_uri("druby://#{config["controller"]["ip"]}:#{config["controller"]["port"]}")
    DRb.start_service("druby://localhost:0", self)
    puts DRb.uri
  end

  def join
   @server.new_nodo(self)
  end

  def hello_from_server(id)
    puts "Hola tu id es #{id}"
  end

  def find_number(number, index)
     puts "Buscando el numero #{index} en #{number.inspect}"
     number.join.scan(/#{index}/).count
     #number.to_s.scan(/#{index}/).count
  end

  def get_config
    config = File.open('config.xml')
    Hash.from_xml(config)
  end

end

nodo = Nodo.new
nodo.join
DRb.thread.join
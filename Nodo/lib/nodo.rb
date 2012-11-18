require 'drb'
class Nodo
  include DRbUndumped

  def initialize(server)
    @server = server
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

end

server = DRbObject.new_with_uri('druby://localhost:5000')
nodo = Nodo.new(server)
nodo.join
DRb.thread.join
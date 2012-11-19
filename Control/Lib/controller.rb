require 'drb'

class Controller

  include DRbUndumped

  def initialize
     DRb.start_service("druby://localhost:5000", self)
     puts DRb.uri
     @nodes = {}
  end

  def run(numero, busqueda)
    init = Time.now
    array = numero.split('')
    sub_arr = array.each_slice(array.count/@nodes.count).to_a
    @suma = 0
    i = 1
    sub_arr.each do |sub|
     # @nodes[i].hello_from_server("pille")      Thread.new do
        @suma += @nodes[i].find_number(sub, busqueda)
      #end
      if i == @nodes.count
        i = 1
      else
        i += 1
      end
      puts "#{i} pille la i"
  #     end
    end
    final = Time.now
    "El numero #{busqueda} se encontro #{@suma} veces, se demoro #{final - init} milisegundos"
  end

  def new_nodo(nodo)
    id = @nodes.count + 1
    @nodes[id] = nodo
    puts @nodes
    nodo.hello_from_server(id)

  end

  def nodes
     "El numero de nodos es #{nodes.count}"
  end
end

Controller.new
DRb.thread.join()

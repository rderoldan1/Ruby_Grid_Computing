require 'drb'

class Controller

  include DRbUndumped

  def initialize
     DRb.start_service("druby://localhost:5000", self)
     puts DRb.uri
     @nodes = {}
     @client = DRbObject.new_with_uri('druby://localhost:4000')

  end

  def run(numero, busqueda)
    init = Time.now
    array = numero.split('')
    puts "oeooe #{array.count}"
    sub_arr = array.each_slice(array.count/@nodes.count).to_a
    @suma = 0
    i = 1
    sub_arr.each do |sub|
      puts @nodes[i]
      @suma += @nodes[i].find_number(sub, busqueda)
      if i == @nodes.count
        i = 1
      else
        i += 1
      end
      puts "#{i} pille la i"
    end
    final = Time.now
    @client.escuchar("El numero #{busqueda} se encontro #{@suma} veces, se demoro #{final - init} milisegundos")
  end

  def new_nodo(nodo)
    id = @nodes.count + 1
    @nodes[id] = nodo
    puts @nodes
    nodo.hello_from_server(id)
    @client.escuchar("El numero de nodos ha aumentado, hay #{id} nodos")
  end

  def nodes
     nodes.count
  end
end

Controller.new
DRb.thread.join()

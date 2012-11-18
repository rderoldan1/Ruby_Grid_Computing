require 'drb'
require 'colorize'

class Cliente

  include DRbUndumped

  def initialize(server)
    @controller =  server
    DRb.start_service("druby://localhost:4000", self)
  end

  def run
    puts "Modo de uso\n".green+
        "====================\n".green+
        "El controlador informa cuando hay nodos nuevos de la siguiente forma.\n".green+
        "El numero de nodos ha aumentado, hay N nodos\n".blue+
        "para saber cuantos nodos hay escriba\n".green+" nodos?\n".blue+
        "para correr la simualcion escriba\n".green+" run [##/random] [numero_a_buscar]\n".blue+
        "para ayuda escriba\n".green+" ayuda?".blue
    escribir
  end

  def escribir
    Thread.new do
      loop do
        r = gets.chomp.split(" ")
        command, number, pattern = r[0], r[1], r[2].to_i
        if r[0].eql? "run"
          begin
            server = DRbObject.new_with_uri('druby://localhost:5000')
            if number.eql? "random"
              @controller.run(Random.rand(1000**1000).to_s,pattern)
            else
              @controller.run(number,pattern)
            end
          rescue Exception => msd
            puts msd
          end
        end
      end
    end
  end

  def escuchar(line)
     puts line
  end

end

server = DRbObject.new_with_uri('druby://localhost:5000')
cliente = Cliente.new(server)
cliente.run
DRb.thread.join

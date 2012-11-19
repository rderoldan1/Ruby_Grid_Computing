require 'drb'
require 'colorize'
require 'active_support/all'

class Cliente

  include DRbUndumped

  def initialize
    config = get_config
    @controller =  DRbObject.new_with_uri("druby://#{config["controller"]["ip"]}:#{config["controller"]["port"]}")
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
            result = if number.eql? "random"
              @controller.run(Random.rand(1000**1000).to_s,pattern)
            else
              @controller.run(number,pattern)
            end
            puts result
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

  def get_config
    config = File.open('config.xml')
    Hash.from_xml(config)
  end

end

cliente = Cliente.new
cliente.run
DRb.thread.join

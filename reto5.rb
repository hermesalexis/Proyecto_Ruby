=begin
Julio 22 de 2016
Pseudocódigo Juego Definiciones y terminos v 1.0
Por: Hermes AGM
Proyecto Final Mòdulo Ruby Make it Real

*************************************************************************
- Crear la clase Game que tiene como atributo una instancia de la clase Parse.
- Game debe tener un método initialize que recibe como parametro
  una instancia de la clase Parse. Éste es el método constructor de la clase Game.
-Game debe tener un método llamado init(público), que debe llamar un método llamado welcome_to_game(privado), el cual
  imprime un mensaje de bievenida. 
-El método init debe llamar al método definitions_parse de la clase Parse (Mediante la instancia que recibe el constructor),
   el cual devuelve un Hash con terminos y definiciones. 
- El método init, debe llamar al método controller(privado), este recibe como paramétro un Hash con terminos y definiciones, este
debe  realizar:
   a. Imprimir definición contenida en Hash
   b leer respuesta.
      - Si la respuesta corresponde a la definición
       ir a a
      - de lo contrario
          Llamar método show_error.
          volver a b.
 
- Crear la clase Parse. Parse debe tener un método definitions_parse, que debe retornar un hash compuesto por 
  terminos (keys) y definiciones(values), información que debe ser leída de un archivo.txt.

=end
# La obligación de esta clase es realizar el proceso de parceo de la información contenida
# Un archivo .txt a hash 
class Parse

  def definitions_parse
  	hash_from_array = {}
  	a_line_data = []
    file = File.open("def_resp.txt")
    file.each_line do |line|
      if line.strip != ""
      	a_line_data << line.strip
      end  
    end  
    hash_from_array = Hash[*a_line_data].invert #convierte array a string e invierte keys por values

  end

end

#Esta clase se encarga de realizar todo el procedimiento funcional del Juego
class Game

  attr_reader :i_parse

  def initialize(i_parse)
    @i_parse = i_parse
  end
  
  def init
    welcome_to_game
    controller(definitions_parse)
  end

  private

  def welcome_to_game
    puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!\n "
  end
  
  def definitions_parse
    @i_parse.definitions_parse
  end
  
  def labels(type)
    case type
    when "def"
      puts "\n\nDEFINICIÓN:\n\n"
    when "resp"
      print "\n >> ADIVINAR: "	
    when "ok"
      puts "\nCORRECTO!\n"
    end
  end

  def controller(h_term_def)
    h_term_def.each do |term, definition|
      labels("def")
      puts definition
      guess = false    
      while(!guess)
        labels("resp")
        response = gets.chomp.downcase
        guess = true if response == term.downcase
        labels("ok") if guess == true
      end 
    end
  end

end


obj1 = Parse.new
obj2 = Game.new(obj1)
obj2.init


  
=begin
Pseudocódigo Juego Definiciones y terminos


***********************************
- Crear la clase Game que tiene como atributo una instancia de la clase Parse.
- Game debe tener un método initialice que recibe como parametro
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

class Parse

  def definitions_parse
  	h = {}
  	i = 1 
    file = File.open("def_resp.txt")
    file.each_line do |line|
      puts "linea blanco" if line == " "
    end
   
        
  end

end

obj1 = Parse.new
puts obj1. definitions_parse


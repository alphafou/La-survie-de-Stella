require 'gosu'

class Game < Gosu::Window

    def initialize
        @Largeur = 900
        @Hauteur = 600
    
        super @Largeur, @Hauteur

        self.caption = "La survie de Stella"

        @fond = Gosu::Image.new("sprites//fond.png", :tileable => true)
        @montagne = Gosu::Image.new("sprites//montagne.png", :tileable => true)
        @sol = Gosu::Image.new("sprites//sol.png", :tileable => true)
        @arbre1 = Gosu::Image.new("sprites//arbre.png", :tileable => true)
        @arbre2 = Gosu::Image.new("sprites//arbre.png", :tileable => true)
        @x = 0
        @y = 0

        @player = Player.new(@Largeur, @Hauteur)
        
    
    end

    def update
        @player.update
        
        
    end

    def draw
        @fond.draw(0, 0, 0)
        @montagne.draw(0, 200, 0)
        @arbre1.draw(-80, 300, 0)
        @arbre2.draw(810, 300, 0)
        @player.draw
        @sol.draw(0, 50, 0)
        
    end


end

class Player
    attr_accessor :x, :y, :z
    
    def initialize(gLargeur, gHauteur)
        @gLargeur = gLargeur
        @gHauteur = gHauteur

        @x = 0
        @y = 520
        @z = 0
        
        @player = Gosu::Image.new("sprites//player.png", :tileable => true)



    end

    def update


        
        if Gosu::button_down?(Gosu::KbRight)
            @x += 5 if @x + 25 < 870

        elsif Gosu::button_down?(Gosu::KbLeft)
            @x -= 5 if @x - 25 > -20

        end
        
        
        
        
        
    end

    def draw
        @player.draw(@x, @y, @z)
    end

end

game = Game.new
game.show
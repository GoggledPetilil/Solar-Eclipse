#===============================================================================
# PokemonTrade_Scene with Fancier Graphics and trading using storage
# by Rua, Graphics modified from Luka S.J's EBDX
# Make sure to add the required graphics
#===============================================================================
#===============================================================================
# PokemonTrade_Scene
#===============================================================================
class PokemonTrade_Scene
  def pbUpdate
    pbUpdateSpriteHash(@sprites)

    # Update particles to move upwards with a 3D effect
    for j in 0...6
      sprite = @sprites["l#{j}"]
      # 3D effect calculations similar to PokemonEvolutionScene
      t = (sprite.y.to_f/@viewport.height)*255
      sprite.tone = Tone.new(t, t, t)
      z = ((sprite.y.to_f - @viewport.height / 2) / (@viewport.height / 2)) * 1.0
      sprite.angle = (z < 0) ? 180 : 0
      sprite.zoom_y = z.abs
      # Move up by 2 pixels each frame
      sprite.y -= 2
      # Reset position if it moves out of screen
      sprite.y = @viewport.height if sprite.y < -sprite.bitmap.height
    end
  end

  def pbRunPictures(pictures, sprites)
    loop do
      for i in 0...pictures.length
        pictures[i].update
      end
      for i in 0...sprites.length
        if sprites[i].is_a?(IconSprite)
          setPictureIconSprite(sprites[i], pictures[i])
        else
          setPictureSprite(sprites[i], pictures[i])
        end
      end
      Graphics.update
      Input.update
      pbUpdate  # Ensure the particles are animated during the picture update loop
      running = false
      for i in 0...pictures.length
        running = true if pictures[i].running?
      end
      break if !running
    end
  end

def pbStartScreen(pokemon, pokemon2, trader1, trader2)
  @sprites = {}
  @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
  @viewport.z = 99999
  @pokemon  = pokemon
  @pokemon2 = pokemon2
  @trader1  = trader1
  @trader2  = trader2
  addBackgroundOrColoredPlane(@sprites, "background", "Trade_EBDX/tradebg",
                              Color.new(248, 248, 248), @viewport)

  # Add particle effects behind Pokémon and Poké Balls
  @path = "Graphics/Pictures/Trade_EBDX/" # Ensure the path is correct
  for j in 0...6
    @sprites["l#{j}"] = Sprite.new(@viewport)
    @sprites["l#{j}"].bitmap = pbBitmap(@path + "line") # Ensure "line" is the correct particle image
    @sprites["l#{j}"].y = (@viewport.height / 6) * j
    @sprites["l#{j}"].ox = @sprites["l#{j}"].bitmap.width / 2
    @sprites["l#{j}"].x = @viewport.width / 2
    @sprites["l#{j}"].z = 1 # Ensure particles are behind Pokémon and Poké Ball sprites
  end

  @sprites["rsprite1"] = PokemonSprite.new(@viewport)
  @sprites["rsprite1"].setPokemonBitmap(@pokemon, false)
  @sprites["rsprite1"].ox = @sprites["rsprite1"].bitmap.width/2
  @sprites["rsprite1"].oy = @sprites["rsprite1"].bitmap.height/2
  @sprites["rsprite1"].x = @viewport.width/2
  @sprites["rsprite1"].y = @viewport.height/2
  @sprites["rsprite1"].z = 50
  @pokemon.species_data.apply_metrics_to_sprite(@sprites["rsprite1"], 1)

  @sprites["rsprite2"] = PokemonSprite.new(@viewport)
  @sprites["rsprite2"].setPokemonBitmap(@pokemon2, false)
  @sprites["rsprite2"].ox = @sprites["rsprite2"].bitmap.width/2
  @sprites["rsprite2"].oy = @sprites["rsprite2"].bitmap.height/2
  @sprites["rsprite2"].x = @viewport.width/2
  @sprites["rsprite2"].y = @viewport.height/2
  @sprites["rsprite2"].z = 50
  @pokemon2.species_data.apply_metrics_to_sprite(@sprites["rsprite2"], 1)
  @sprites["rsprite2"].visible = false

  # Initialize black bars for intro animation
  @sprites["bar1"] = Sprite.new(@viewport)
  @sprites["bar1"].create_rect(@viewport.width, @viewport.height / 2, Color.black)
  @sprites["bar1"].z = 99999
  @sprites["bar2"] = Sprite.new(@viewport)
  @sprites["bar2"].create_rect(@viewport.width, @viewport.height / 2, Color.black)
  @sprites["bar2"].y = @viewport.height / 2
  @sprites["bar2"].z = 99999
  
  # Initialize the shine effect
  @sprites["shine"] = Sprite.new(@viewport)
  @sprites["shine"].bitmap = pbBitmap(@path + "shine1")
  @sprites["shine"].ox = @sprites["shine"].bitmap.width / 2
  @sprites["shine"].oy = @sprites["shine"].bitmap.height / 2
  @sprites["shine"].x = Graphics.width / 2
  @sprites["shine"].y = Graphics.height / 2
  @sprites["shine"].zoom_x = 0
  @sprites["shine"].zoom_y = 0
  @sprites["shine"].opacity = 0
  @sprites["shine"].z = 60

  # Animate the bars moving out from the center more smoothly
  40.times do  # Increase the number of iterations for a smoother animation
    Graphics.update
    pbUpdate
    @sprites["bar1"].y -= @sprites["bar1"].bitmap.height / 32  # Move bars slower
    @sprites["bar2"].y += @sprites["bar2"].bitmap.height / 32  # Move bars slower
  end

  # Optional: Fade the bars out gradually as they move
  16.times do
    Graphics.update
    pbUpdate
    @sprites["bar1"].opacity -= 16
    @sprites["bar2"].opacity -= 16
  end

  @sprites["msgwindow"] = pbCreateMessageWindow(@viewport)
  #pbFadeInAndShow(@sprites)
end

  
def pbShineEffect
  pbSEPlay("Anim/Saint6")  # Play the shine sound effect
  
  # Create multiple shine sprites
  for j in 0...64
    @sprites["p#{j}"] = Sprite.new(@viewport)
    n = [5, 2][rand(2)]  # Randomly choose between two shine images
    @sprites["p#{j}"].bitmap = pbBitmap(@path + "shine#{n}")
    @sprites["p#{j}"].z = 10
    @sprites["p#{j}"].ox = @sprites["p#{j}"].bitmap.width / 2
    @sprites["p#{j}"].oy = @sprites["p#{j}"].bitmap.height / 2
    @sprites["p#{j}"].x = rand(@viewport.width + 1)
    @sprites["p#{j}"].y = @viewport.height / 2 + rand(@viewport.height / 2 - 64)
    z = [0.2, 0.4, 0.5, 0.6, 0.8, 1.0][rand(6)]
    @sprites["p#{j}"].zoom_x = z
    @sprites["p#{j}"].zoom_y = z
    @sprites["p#{j}"].opacity = 0
    @sprites["p#{j}"].speed = 2 + rand(5)
  end

  # Animate the shines
  for i in 0...64
    Graphics.update
    pbUpdate
    for j in 0...64
      sprite = @sprites["p#{j}"]
      sprite.opacity += (i < 32 ? 2 : -2) * sprite.speed
      sprite.y -= 1 if i % sprite.speed == 0
      if sprite.opacity > 128
        sprite.zoom_x /= 1.5
        sprite.zoom_y /= 1.5
      end
    end
  end

  # Dispose of the shine sprites after the animation
  for j in 0...64
    @sprites["p#{j}"].dispose
  end
end


  def pbScene1
    spriteBall = IconSprite.new(0, 0, @viewport)
    spriteBall.z = 15  # Ensure it is above the particle lines
    pictureBall = PictureEx.new(0)
    picturePoke = PictureEx.new(0)
    ballimage = sprintf("Graphics/Battle animations/ball_%s", @pokemon.poke_ball)
    if !pbResolveBitmap(ballimage)
      ballimage = sprintf("Graphics/Battle animations/ball_%02d", pbGetBallType(@pokemon.poke_ball))
    end
    ballopenimage = sprintf("Graphics/Battle animations/ball_%s_open", @pokemon.poke_ball)
    if !pbResolveBitmap(ballimage)
      ballopenimage = sprintf("Graphics/Battle animations/ball_%02d_open", pbGetBallType(@pokemon.poke_ball))
    end
    # Starting position of ball
    pictureBall.setXY(0, Graphics.width / 2, 48)
    pictureBall.setName(0, ballimage)
    pictureBall.setSrcSize(0, 32, 64)
    pictureBall.setOrigin(0, PictureOrigin::Center)
    pictureBall.setVisible(0, true)
    # Starting position of sprite
    picturePoke.setXY(0, @sprites["rsprite1"].x, @sprites["rsprite1"].y)
#    picturePoke.setOrigin(0, PictureOrigin::Bottom)
    picturePoke.setVisible(0, true)
    # Change Pokémon color
    picturePoke.moveColor(2, 5, Color.new(31 * 8, 22 * 8, 30 * 8, 255))
    # Recall
    delay = picturePoke.totalDuration
    picturePoke.setSE(delay, "Battle recall")
    pictureBall.setName(delay, ballopenimage)
    pictureBall.setSrcSize(delay, 32, 64)
    # Move sprite to ball
    picturePoke.moveZoom(delay, 8, 0)
    picturePoke.moveXY(delay, 8, Graphics.width / 2, 48)
    picturePoke.setSE(delay + 5, "Battle jump to ball")
    picturePoke.setVisible(delay + 8, false)
    delay = picturePoke.totalDuration + 1
    pictureBall.setName(delay, ballimage)
    pictureBall.setSrcSize(delay, 32, 64)
    # Make Poké Ball go off the top of the screen
    delay = picturePoke.totalDuration + 10
    pictureBall.moveXY(delay, 6, Graphics.width / 2, -32)
    # Play animation
    pbRunPictures(
      [picturePoke, pictureBall],
      [@sprites["rsprite1"], spriteBall]
    )
    spriteBall.dispose
  end

  def pbScene2
    spriteBall = IconSprite.new(0, 0, @viewport)
    spriteBall.z = 15  # Ensure it is above the particle lines
    pictureBall = PictureEx.new(0)
    picturePoke = PictureEx.new(0)
    ballimage = sprintf("Graphics/Battle animations/ball_%s", @pokemon2.poke_ball)
    if !pbResolveBitmap(ballimage)
      ballimage = sprintf("Graphics/Battle animations/ball_%02d", pbGetBallType(@pokemon2.poke_ball))
    end
    ballopenimage = sprintf("Graphics/Battle animations/ball_%s_open", @pokemon2.poke_ball)
    if !pbResolveBitmap(ballimage)
      ballopenimage = sprintf("Graphics/Battle animations/ball_%02d_open", pbGetBallType(@pokemon2.poke_ball))
    end
    # Starting position of ball
    pictureBall.setXY(0, Graphics.width / 2, -32)
    pictureBall.setName(0, ballimage)
    pictureBall.setSrcSize(0, 32, 64)
    pictureBall.setOrigin(0, PictureOrigin::Center)
    pictureBall.setVisible(0, true)
    # Starting position of sprite
#    picturePoke.setOrigin(0, PictureOrigin::Bottom)
    picturePoke.setZoom(0, 0)
    picturePoke.setColor(0, Color.new(31 * 8, 22 * 8, 30 * 8, 255))
    picturePoke.setVisible(0, false)
    # Dropping ball
    y = Graphics.height - 96 - 16 - 16   # end point of Poké Ball
    delay = picturePoke.totalDuration + 2
    for i in 0...4
      t = [4, 4, 3, 2][i]   # Time taken to rise or fall for each bounce
      d = [1, 2, 4, 8][i]   # Fraction of the starting height each bounce rises to
      delay -= t if i == 0
      if i > 0
        pictureBall.setZoomXY(delay, 100 + 5 * (5 - i), 100 - 5 * (5 - i))   # Squish
        pictureBall.moveZoom(delay, 2, 100)                      # Unsquish
        pictureBall.moveXY(delay, t, Graphics.width / 2, y - 100 / d)
      end
      pictureBall.moveXY(delay + t, t, Graphics.width / 2, y)
      pictureBall.setSE(delay + 2 * t, "Battle ball drop")
      delay = pictureBall.totalDuration
    end
    picturePoke.setXY(delay, Graphics.width / 2, y)
    # Open Poké Ball
    delay = pictureBall.totalDuration + 15
    pictureBall.setSE(delay, "Battle recall")
    pictureBall.setName(delay, ballopenimage)
    pictureBall.setSrcSize(delay, 32, 64)
    pictureBall.setVisible(delay + 5, false)
    # Pokémon appears and enlarges
    picturePoke.setVisible(delay, true)
    picturePoke.moveZoom(delay, 8, 100)
    picturePoke.moveXY(delay, 8, Graphics.width / 2, @sprites["rsprite2"].y)
    # Return Pokémon's color to normal and play cry
    delay = picturePoke.totalDuration
    picturePoke.moveColor(delay, 5, Color.new(31 * 8, 22 * 8, 30 * 8, 0))
    cry = GameData::Species.cry_filename_from_pokemon(@pokemon2)
    picturePoke.setSE(delay, cry) if cry
    # Play animation
    pbRunPictures(
      [picturePoke, pictureBall],
      [@sprites["rsprite2"], spriteBall]
    )
      # Play shine effect at the end
     pbShineEffect
    spriteBall.dispose
  end

  def pbEndScreen
    pbDisposeMessageWindow(@sprites["msgwindow"])
    pbFadeOutAndHide(@sprites)
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
    newspecies = @pokemon2.check_evolution_on_trade(@pokemon)
    if newspecies
      evo = PokemonEvolutionScene.new
      evo.pbStartScreen(@pokemon2, newspecies)
      evo.pbEvolution(false)
      evo.pbEndScreen
    end
  end

  def pbTrade
    pbBGMStop
    pbBGMPlay("EBDX/Evolution")
    @pokemon.play_cry
    speciesname1 = GameData::Species.get(@pokemon.species).name
    speciesname2 = GameData::Species.get(@pokemon2.species).name
    pbMessageDisplay(@sprites["msgwindow"],
                     _ISPRINTF("Sending {1:s} to {2:s}.\r\nGood-bye, {1:s}!\\wtnp[0]",
                               @pokemon.name, @trader2)) { pbUpdate }
    pbMessageWaitForInput(@sprites["msgwindow"], 50, true) { pbUpdate }
    pbPlayDecisionSE
    pbScene1
#    pbMessageDisplay(@sprites["msgwindow"],
#                     _INTL("For {1}'s {2},\r\n{3} sends {4}.\1", @trader1, speciesname1, @trader2, speciesname2)) { pbUpdate }
#    pbMessageDisplay(@sprites["msgwindow"],
#                     _INTL("{1} bids farewell to {2}.", @trader2, speciesname2)) { pbUpdate }
    pbScene2
    pbMessageDisplay(@sprites["msgwindow"],
                     _ISPRINTF("\\me[Pkmn get]{1:s} sent over\r\n{2:s}.\\wtnp[160]\1",
                               @pokemon2.owner.name,@pokemon2.name)) { pbUpdate }
    pbMessageDisplay(@sprites["msgwindow"],
                     _INTL("Take good care of {1}!", speciesname2)) { pbUpdate }
  end
end

#===============================================================================
# Start the trade process
#===============================================================================
def pbStartTrade(pokemonIndex, newpoke, nickname, trainerName, trainerGender = 0)
  myPokemon = $Trainer.party[pokemonIndex]
  opponent = NPCTrainer.new(trainerName, trainerGender)
  opponent.id = $Trainer.make_foreign_ID
  yourPokemon = nil
  resetmoves = true
  if newpoke.is_a?(Pokemon)
    newpoke.owner = Pokemon::Owner.new_from_trainer(opponent)
    yourPokemon = newpoke
    resetmoves = false
  else
    species_data = GameData::Species.try_get(newpoke)
    raise _INTL("Species does not exist ({1}).", newpoke) if !species_data
    yourPokemon = Pokemon.new(species_data.id, myPokemon.level, opponent)
  end
  yourPokemon.name          = nickname
  yourPokemon.obtain_method = 2   # traded
  yourPokemon.reset_moves if resetmoves
  yourPokemon.record_first_moves
  $Trainer.pokedex.register(yourPokemon)
  $Trainer.pokedex.set_owned(yourPokemon.species)
  pbFadeOutInWithMusic {
    evo = PokemonTrade_Scene.new
    evo.pbStartScreen(myPokemon, yourPokemon, $Trainer.name, opponent.name)
    evo.pbTrade
    evo.pbEndScreen
  }
  $Trainer.party[pokemonIndex] = yourPokemon
end

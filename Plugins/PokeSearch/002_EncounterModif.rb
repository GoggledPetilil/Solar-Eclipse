# All of the berry effects modifying the encounter
Events.onWildPokemonCreate+=proc {|sender,e|
  if $PokemonSystem.pokesearch_encounter
    pkmn = e[0]
    if $PokemonSystem.current_berry != nil
      case $PokemonSystem.current_berry
      when :ODDINCENSE
        if (rand(10)==1)
          pkmn.ability_index=2
        end
      when :SEAINCENSE, :WAVEINCENSE
        if (rand(50)==1)
          pkmn.givePokerus
        end
      when :ROSEINCENSE
        items = pkmn.wildHoldItems
        chances = [50,50,50]
        itemrnd = rand(100)
        if (items[0]==items[1] && items[1]==items[2]) || itemrnd<chances[0]
          pkmn.item = items[0]
        elsif itemrnd<(chances[0]+chances[1])
          pkmn.item = items[1]
        elsif itemrnd<(chances[0]+chances[1]+chances[2])
          pkmn.item = items[2]
        end
      when :ROCKINCENSE
        GameData::Stat.each_main do |s|
          pkmn.iv[s.id] = [pkmn.iv[s.id]+10, Pokemon::IV_STAT_LIMIT].min
        end
      when :LUCKINCENSE
        odds = Settings::SHINY_POKEMON_CHANCE * 2
        if GameData::Item.exists?(:SHINYCHARM) && $PokemonBag.pbHasItem?(:SHINYCHARM)
          odds = odds * 2
        end
        if (rand(odds)==1)
          pkmn.shiny = true
        end
      end
    end
    pkmn.reset_moves
    pkmn.calc_stats
  end
}

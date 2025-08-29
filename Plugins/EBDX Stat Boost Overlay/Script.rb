class DataBoxEBDX  <  SpriteWrapper
  alias setUp_StatOverlay setUp
  def setUp
    setUp_StatOverlay
    sXp = 176
    sYp = @battle.singleBattle? ? -46 : -34
    sXe = 4
    sYe = @battle.singleBattle? ? 22 : 18
    sXoffset = 46
    sYoffset = 22

    if @battle.singleBattle?
      @sprites["boost1"] = Sprite.new(@viewport)
      @sprites["boost1"].bitmap = nil
      @sprites["boost1"].z = 1
      @sprites["boost1"].ex = @playerpoke ? (sXp - sXoffset * 0) : (sXe + sXoffset * 0)
      @sprites["boost1"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost1"].visible = false

      @sprites["boost2"] = Sprite.new(@viewport)
      @sprites["boost2"].bitmap = nil
      @sprites["boost2"].z = 1
      @sprites["boost2"].ex = @playerpoke ? (sXp - sXoffset * 1) : (sXe + sXoffset * 1)
      @sprites["boost2"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost2"].visible = false

      @sprites["boost3"] = Sprite.new(@viewport)
      @sprites["boost3"].bitmap = nil
      @sprites["boost3"].z = 1
      @sprites["boost3"].ex = @playerpoke ? (sXp - sXoffset * 2) : (sXe + sXoffset * 2)
      @sprites["boost3"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost3"].visible = false

      @sprites["boost4"] = Sprite.new(@viewport)
      @sprites["boost4"].bitmap = nil
      @sprites["boost4"].z = 1
      @sprites["boost4"].ex = @playerpoke ? (sXp - sXoffset * 3) : (sXe + sXoffset * 3)
      @sprites["boost4"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost4"].visible = false

      @sprites["boost5"] = Sprite.new(@viewport)
      @sprites["boost5"].bitmap = nil
      @sprites["boost5"].z = 1
      @sprites["boost5"].ex = @playerpoke ? (sXp - sXoffset * 0) : (sXe + sXoffset * 0)
      @sprites["boost5"].ey = @playerpoke ? (sYp - sYoffset * 1) : (sYe + sYoffset * 1)
      @sprites["boost5"].visible = false

      @sprites["boost6"] = Sprite.new(@viewport)
      @sprites["boost6"].bitmap = nil
      @sprites["boost6"].z = 1
      @sprites["boost6"].ex = @playerpoke ? (sXp - sXoffset * 1) : (sXe + sXoffset * 1)
      @sprites["boost6"].ey = @playerpoke ? (sYp - sYoffset * 1) : (sYe + sYoffset * 1)
      @sprites["boost6"].visible = false

      @sprites["boost7"] = Sprite.new(@viewport)
      @sprites["boost7"].bitmap = nil
      @sprites["boost7"].z = 1
      @sprites["boost7"].ex = @playerpoke ? (sXp - sXoffset * 2) : (sXe + sXoffset * 2)
      @sprites["boost7"].ey = @playerpoke ? (sYp - sYoffset * 1) : (sYe + sYoffset * 1)
      @sprites["boost7"].visible = false
    else
      @sprites["boost1"] = Sprite.new(@viewport)
      @sprites["boost1"].bitmap = nil
      @sprites["boost1"].z = 1
      @sprites["boost1"].ex = @playerpoke ? (sXp - sXoffset * 0) : (sXe + sXoffset * 0)
      @sprites["boost1"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost1"].visible = false

      @sprites["boost2"] = Sprite.new(@viewport)
      @sprites["boost2"].bitmap = nil
      @sprites["boost2"].z = 1
      @sprites["boost2"].ex = @playerpoke ? (sXp - sXoffset * 1) : (sXe + sXoffset * 1)
      @sprites["boost2"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost2"].visible = false

      @sprites["boost3"] = Sprite.new(@viewport)
      @sprites["boost3"].bitmap = nil
      @sprites["boost3"].z = 1
      @sprites["boost3"].ex = @playerpoke ? (sXp - sXoffset * 2) : (sXe + sXoffset * 2)
      @sprites["boost3"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost3"].visible = false

      @sprites["boost4"] = Sprite.new(@viewport)
      @sprites["boost4"].bitmap = nil
      @sprites["boost4"].z = 1
      @sprites["boost4"].ex = @playerpoke ? (sXp - sXoffset * 3) : (sXe + sXoffset * 3)
      @sprites["boost4"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost4"].visible = false

      @sprites["boost5"] = Sprite.new(@viewport)
      @sprites["boost5"].bitmap = nil
      @sprites["boost5"].z = 1
      @sprites["boost5"].ex = @playerpoke ? (sXp - sXoffset * 4) : (sXe + sXoffset * 4)
      @sprites["boost5"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost5"].visible = false

      @sprites["boost6"] = Sprite.new(@viewport)
      @sprites["boost6"].bitmap = nil
      @sprites["boost6"].z = 1
      @sprites["boost6"].ex = @playerpoke ? (sXp - sXoffset * 5) : (sXe + sXoffset * 5)
      @sprites["boost6"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost6"].visible = false

      @sprites["boost7"] = Sprite.new(@viewport)
      @sprites["boost7"].bitmap = nil
      @sprites["boost7"].z = 1
      @sprites["boost7"].ex = @playerpoke ? (sXp - sXoffset * 6) : (sXe + sXoffset * 6)
      @sprites["boost7"].ey = @playerpoke ? (sYp - sYoffset * 0) : (sYe + sYoffset * 0)
      @sprites["boost7"].visible = false
    end
  end
  alias update_StatOverlay update
  def update
    update_StatOverlay
    # shows stat boosts
    stat_boost = []
    $stat_boost = stat_boost
    bAtk = @battler.stages[:ATTACK]
    bDef = @battler.stages[:DEFENSE]
    bSAt = @battler.stages[:SPECIAL_ATTACK]
    bSDf = @battler.stages[:SPECIAL_DEFENSE]
    bSpd = @battler.stages[:SPEED]
    bAcc = @battler.stages[:ACCURACY]
    bEva = @battler.stages[:EVASION]
    stat_boost.push(:ATTACK) 		if bAtk != 0
    stat_boost.push(:DEFENSE) 		if bDef != 0
    stat_boost.push(:SPECIAL_ATTACK) 	if bSAt != 0
    stat_boost.push(:SPECIAL_DEFENSE) 	if bSDf != 0
    stat_boost.push(:SPEED) 		if bSpd != 0
    stat_boost.push(:ACCURACY) 		if bAcc != 0
    stat_boost.push(:EVASION) 		if bEva != 0

    @sprites["boost1"].bitmap = (stat_boost.size > 0) ? pbBitmap(getBitmap(stat_boost[0])) : nil
    @sprites["boost1"].visible = (stat_boost.size > 0 && self.visible == true) ? true : false

    @sprites["boost2"].bitmap = (stat_boost.size > 1) ? pbBitmap(getBitmap(stat_boost[1])) : nil
    @sprites["boost2"].visible = (stat_boost.size > 1 && self.visible == true) ? true : false

    @sprites["boost3"].bitmap = (stat_boost.size > 2) ? pbBitmap(getBitmap(stat_boost[2])) : nil
    @sprites["boost3"].visible = (stat_boost.size > 2 && self.visible == true) ? true : false

    @sprites["boost4"].bitmap = (stat_boost.size > 3) ? pbBitmap(getBitmap(stat_boost[3])) : nil
    @sprites["boost4"].visible = (stat_boost.size > 3 && self.visible == true) ? true : false

    @sprites["boost5"].bitmap = (stat_boost.size > 4) ? pbBitmap(getBitmap(stat_boost[4])) : nil
    @sprites["boost5"].visible = (stat_boost.size > 4 && self.visible == true) ? true : false

    @sprites["boost6"].bitmap = (stat_boost.size > 5) ? pbBitmap(getBitmap(stat_boost[5])) : nil
    @sprites["boost6"].visible = (stat_boost.size > 5 && self.visible == true) ? true : false

    @sprites["boost7"].bitmap = (stat_boost.size > 6) ? pbBitmap(getBitmap(stat_boost[6])) : nil
    @sprites["boost7"].visible = (stat_boost.size > 6 && self.visible == true) ? true : false
  end

  def getBitmap(stat)
    string = @path + "Modifiers/"
    bAtk = @battler.stages[:ATTACK]
    bDef = @battler.stages[:DEFENSE]
    bSAt = @battler.stages[:SPECIAL_ATTACK]
    bSDf = @battler.stages[:SPECIAL_DEFENSE]
    bSpd = @battler.stages[:SPEED]
    bAcc = @battler.stages[:ACCURACY]
    bEva = @battler.stages[:EVASION]
    if stat.to_s == "ATTACK"
      string = string + "Atk#{bAtk}"
    elsif stat.to_s == "DEFENSE"
      string = string + "Def#{bDef}"
    elsif stat.to_s == "SPECIAL_ATTACK"
      string = string + "SpAtk#{bSAt}"
    elsif stat.to_s == "SPECIAL_DEFENSE"
      string = string + "SpDef#{bSDf}"
    elsif stat.to_s == "SPEED"
      string = string + "Spe#{bSpd}"
    elsif stat.to_s == "ACCURACY"
      string = string + "Acc#{bAcc}"
    elsif stat.to_s == "EVASION"
      string = string + "Eva#{bEva}"
    end
    return string
  end
end
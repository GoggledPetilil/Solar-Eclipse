TITLE_FONT		= MessageConfig.pbGetSystemFontName
TEXT_FONT		= MessageConfig.pbGetSmallFontName
TITLE_SIZE 		= 29
TEXT_SIZE 		= 25
PAGE_TURN_SFX 		= "Book1"
TEXT_OPEN_SFX 		= "Book2"
TEXT_MAIN_COLOR   	= Color.new(80, 80, 88)
TEXT_SHADOW_COLOR   	= Color.new(160, 160, 168)

#books
BookZero = [
"The Unification War","Under the tyranny of fear and chaos, the people were divided and disorganised. In an effort to obtain as much power as possible for themselves, conflict between clans was a constant. More and more of the population took up arms to defend themselves from the threats.",
"The Unification War","From the land of Helianthus the Unification Hero appeared and, by harmonising with the people's anger and turmoil, amassed a large military force and fought countless battles. His strength and charisma made the people unite under his banner and fight until his opposition had been thoroughly eliminated.",
"The Unification War","The land had been united under one banner, but the Unification Hero was left without a proper heir. The crown was given to the Unification Hero's second-in-command General Cornelius. The 14 Noble Houses were created by the highest ranking generals of the Unification Army and the glorious Solaria Monarchy was established."
]

BookOne = [
"The History of Solaria, Part I","-Regnal Year 1: The Founding of the Kingdom of Solaria-\nIn the first year of the Solarian calender, the glorious Solaria Monarchy was established. Helianthus was chosen as its capital and the central seat of power for the Solarian royal family. ",
"The History of Solaria, Part I","-Regnal Year 1: The Founding of the Kingdom of Solaria-\n14 Noble Houses were created by the highest ranking generals of the Unification Army to maintain loyalty to the crown. These are the Houses of: Astor, Biytea, Jadevik, Dinnex, Farnlor, Fishland, Illdoos, Junkar, Malum, Myrfield, Polallon, Pumon, Towngor and Zimbani.",
"The History of Solaria, Part I","-Regnal Year 1: The Founding of the Kingdom of Solaria-\nThe inaugural King Indulf Cornelius expanded the nobility, established the Solarian judicial system and remained on the frontlines to maintain peace across the land.",
"The History of Solaria, Part I","-Regnal Year 107: The Seeds of Corruption-\nYears of prosperity came to an end with the sudden passing of Queen Alicia. Successor King Ernest failed to live up to the people's expectations as Solaria suffered an economic crash. Noble Houses began to scheme behind the scenes to gain more power and wealth for themselves.",
"The History of Solaria, Part I","-Regnal Year 158: The Eighty Year War-\nNorthern and central Towngor came into conflict with each other due to a civil uprising. Wilhelm Towngor joined the uprising, declaring war on his brother and managed to drive the central Towngor forced back establishing a brief period of peace.",
"The History of Solaria, Part I","-Regnal Year 238: The End of the Eighty Year War-\nThe brief period of peace between northern and central had been broken with the assassination of the resistance leader Evan van Holtlant. His successor, Linda van Holtlant, swore vengeance and forced House Towngor to surrender and cut ties with northern Towngor. House Holtlant had gained independence.",
"The History of Solaria, Part I","-Regnal Year 246: The War of Lilies-\nFollowing multiple assassinations of Solarian royalty, an investigation was set into motion and House Ildoos was found guilty. War broke out between House Ildoos and the Solarian monarchy, resulting in the complete destruction of the Ildoos bloodline.",
"The History of Solaria, Part I","-Regnal Year 306: The Junkar Civil War-\nTudwal Telgior, an ordinary working class citizen, discovered a valuable mine within Junkar territory. He used his new high income and influence to establish House Telgior within Junkar territory. House Junkar attempted to stop him, but Tudwal's new power was too much and the new territory of Telgior gained independence.",
"The History of Solaria, Part I","-Regnal Year 309: The War of Feeding-\nWith the increase of the military budget by King Augustus, the common folk began to starve and eventually rose against the crown.The King would retaliate but quickly lost allies to the resistance and would eventually meet his end to poisoned supper in Regnal Year 342.",
"The History of Solaria, Part I","-Regnal Year 356: First Contact with Areinal-\nSucceeding King Augustus, King Edmund was tasked with earning the people's trust and rebuilding the ruined Solaria. The King had made contact with the distant Areinal region and, using his excellent diplomacy skills, secured trading relationship with the tropical region.",
"The History of Solaria, Part I","-Regnal Year 460: The Pumon Civil War-\nHouse Pumon slowly began to lose power and influence. Unable to pay their debts, parts of their border lands were given to the growing House Schicksals. A civil war erupted within Pumon territory with the common folk seeing House Pumon as weak and cowardice. 40 years of fighting only left Pumon in a worse state than before.",
"The History of Solaria, Part I","-Regnal Year 512: Establishment of the Border Alliance-\nWith the increasing power of smaller noble houses in the north, House Schicksals, House Eisenblut, House Mondwanderer, House Airbva and House Meeresbeobachter formed the Border Alliance to ensure economic growth, free trade and protection from northern Lunarian forces and other threats.",
"The History of Solaria, Part I","-Regnal Year 524: The Battle of Fishland-\nFrom the east, the Lunaria region invaded Solaria. They attempted to break into Solaria territory via Fishland in the south. House Fishland and Jadevik fought to defend the border, managing to drive the Lunarian invasion back at the cost of losing Fishland completely to Lunaria.",
"The History of Solaria, Part I","-Regnal Year 567: The Ghostly Plague-\nSolaria had prospered under King Cedric for many years thanks to his business and diplomacy skills ensuring trade between neighbouring regions. However, a plague had been brought to Solaria via rats travelling on trading ships. An estimated 40-60% of Solaria had been killed off to the Ghostly Plague, littering towns with ghostly husks.",
"The History of Solaria, Part I","-Regnal Year 627: The War of Nightshade-\nThe ruling and well-beloved monarch, Queen Serena, had been assassinated. The entire region of Solaria was struck with grief and great efforts were made to find her killer. Eventually, it was found that House Dinnex was behind the assassinations and their land and entire bloodline was destroyed in retaliation. Dinnex territory was absorbed into Malum, the greatest asset in the War of Nightshade."
]

Books = [
BookZero,
BookOne
]

def textbook(book)
    scene = Textbook_Scene.new
    screen = TextbookScreen.new(scene)
    screen.pbStartTextbookScreen(book)
    yield if block_given?
    pbFadeInAndShow(@sprites)
end


class TextbookScreen
  def initialize(scene)
    @scene = scene
  end

  def pbStartTextbookScreen(book)
    @scene.pbStartTextbookScene(book)
    ret = @scene.pbTextbookScene
    @scene.pbEndScene
    return ret
  end

end


class Textbook_Scene

  def pbUpdate
    pbUpdateSpriteHash(@sprites)
  end

  def pbStartTextbookScene(book)
    @viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z = 99999
    @page = 0
    @book = book
    @bookarray= Books[book]
    @max=Books[book].length
    #@max+=4
    #@max/=2
    @sprites = {}
    @sprites["background"] = IconSprite.new(0,0,@viewport)
    @sprites["overlay"] = BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    pbSetSystemFont(@sprites["overlay"].bitmap)
    @sprites["leftarrow"] = AnimatedSprite.new("Graphics/Pictures/leftarrow",8,40,28,2,@viewport)
    @sprites["leftarrow"].x       = -4
    @sprites["leftarrow"].y       = 10
    @sprites["leftarrow"].play
    @sprites["rightarrow"] = AnimatedSprite.new("Graphics/Pictures/rightarrow",8,40,28,2,@viewport)
    @sprites["rightarrow"].x       = (Graphics.width)-36
    @sprites["rightarrow"].y       = 10
    @sprites["rightarrow"].visible = (!@choosing || numfilledpockets>1)
    @sprites["rightarrow"].play
    drawTextbookPage(@page)
    pbSEPlay(TEXT_OPEN_SFX)
    pbFadeInAndShow(@sprites) { pbUpdate }
  end

  def pbEndScene
    pbFadeOutAndHide(@sprites) { pbUpdate }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end


  def drawTextbookPage(page)
    book   = @book
    @sprites["leftarrow"].visible = (@page>0)
    @sprites["rightarrow"].visible = (@page+3<@max)
    overlay = @sprites["overlay"].bitmap
    overlay.clear
    # Set background image
    @sprites["background"].setBitmap("Graphics/Pictures/textbookbg")
    imagepos=[]
    # Write various bits of text
    # Write Title
    pagename = @bookarray[page]
    textpos = [
       [pagename,Graphics.width/2,2,2,TEXT_MAIN_COLOR,TEXT_SHADOW_COLOR]
    ]
    @sprites["overlay"].bitmap.font.name=TITLE_FONT
    @sprites["overlay"].bitmap.font.size=TITLE_SIZE
    pbDrawTextPositions(overlay,textpos)
    # Write Main Text
    @sprites["overlay"].bitmap.font.name=TEXT_FONT
    @sprites["overlay"].bitmap.font.size=TEXT_SIZE
    text=@bookarray[page+1]
    drawFormattedTextEx(overlay,26,43,Graphics.width-40,text,TEXT_MAIN_COLOR,TEXT_SHADOW_COLOR)
    # Write Page Number
    @sprites["overlay"].bitmap.font.name=TEXT_FONT
    @sprites["overlay"].bitmap.font.size=TEXT_SIZE
    pageNumber=(@page/2+1).to_s + "/" + (@max/2).to_s
    textpos = [
       [pageNumber,Graphics.width/2,Graphics.height-38,2,TEXT_MAIN_COLOR,TEXT_SHADOW_COLOR]
    ]
    pbDrawTextPositions(overlay,textpos)
  end


  def pbTextbookScene
    loop do
      Graphics.update
      Input.update
      pbUpdate
      dorefresh = false
      if Input.trigger?(Input::BACK)
        pbPlayCloseMenuSE
        break
      elsif Input.trigger?(Input::LEFT)
        oldpage = @page
        @page -= 2
        @page = 0 if @page<0
        if @page!=oldpage   # Move to next page
          pbSEPlay(PAGE_TURN_SFX)
          dorefresh = true
        end
      elsif Input.trigger?(Input::RIGHT)
        oldpage = @page
        @page += 2
        @page = @max-2 if @page+3>@max
        if @page!=oldpage   # Move to next page
          pbSEPlay(PAGE_TURN_SFX)
          dorefresh = true
        end
      end
      if dorefresh
        drawTextbookPage(@page)
      end
    end
  end
end
module QuestModule
  
  # You don't actually need to add any information, but the respective fields in the UI will be blank or "???"
  # I included this here mostly as an example of what not to do, but also to show it's a thing that exists
  Quest0 = {
  
  }
  
  # Here's the simplest example of a single-stage quest with everything specified
  Quest1 = {
    :ID => "1",
    :Name => "Become the Solar Monarch",
    :QuestGiver => "You",
    :Location0 => "Gardenia Academy",
    :Location1 => :Location0,
    :QuestDescription => "Your life-long dream is within grasp now that you've collected the 8 Gym Badges. Head to Gardenia Academy, participate in and win the Solaria Coronation Tournament, and be crowned the new Solar Monarch.",
    :RewardString => "Being crowned Solar Monarch"
  }
  
  # Here's an extension of the above that includes multiple stages
  Quest2 = {
    :ID => "2",
    :Name => "The Successors",
    :QuestGiver => "Move Sage",
    :Location0 => "Holtlant Town",
    :Location1 => :Location0,
    :QuestDescription => "The Move Sage wants to pass down his teachings to 3 disciples. If you find anyone stuck in a rut who has potential, direct them to him.",
    :RewardString => "Move Tutoring"
  }
  
  # Here's an example of a quest with lots of stages that also doesn't have a stage location defined for every stage
  Quest3 = {
    :ID => "3",
    :Name => "The Fairy Queen of the Moon",
    :QuestGiver => "Diana",
    :Location0 => "Myrfield Gym",
    :Location1 => :Location0,
    :QuestDescription => "The new Myrfield Gym Leader Diana has asked you to be her first challenger. Defeat her in battle to earn your 10th Gym Badge.",
    :RewardString => "Gym Badge"
  }
  
  # Here's an example of not defining the quest giver and reward text
  Quest4 = {
    :ID => "4",
    :Name => "The Lost Pokénect",
    :QuestGiver => "Lost Pokénect Owner",
    :Location0 => "???",
    :Location1 => :Location0,
    :QuestDescription => "You found a Pokénect on the ground and were called by its owner, who is temporarily unable to pick it up. Hold on to the device until you get the call to meet up with the owner and return it to them.",
    :RewardString => "Pokénect Owner's Contact Details"
  }
  
  # Other random examples you can look at if you want to fill out the UI and check out the page scrolling
  Quest5 = {
    :ID => "5",
    :Name => "The Flute of the Stars",
    :QuestGiver => "Team Sol Researcher",
    :Location0 => "Sol Research Lab",
    :Location1 => :Location0,
    :QuestDescription => "A scientist in the Sol Research Lab has shared with you information on a flute that could summon a Pokémon of the cosmos. To restore the flute to its full power, he's asked you to show him the Elite Four for research.",
    :RewardString => "Nebula Flute"
  }
  
  Quest6 = {
    :ID => "6",
    :Name => "The Friendless Cosplay Girl",
    :QuestGiver => "Parasol Lady",
    :Location0 => "Jyeshtha City",
    :Location1 => :Location0,
    :QuestDescription => "A lady has informed you of a Cosplay Girl in Jyeshtha City who lacks friends, but is fond of Swadloon. Perhaps giving her a Swadloon will brighten up her life.",
    :RewardString => "nil"
  }
  
  Quest7 = {
    :ID => "7",
    :Name => "The Gym Challenge",
    :QuestGiver => "You",
    :Location0 => "Solaria",
    :Location1 => :Location0,
    :QuestDescription => "It is a great honour to participate in the Gym Challenge and you have been chosen to do so. Travel the Solaria region and challenge the 8 Gym Leaders to earn their Gym Badge.",
    :RewardString => "Privledge of participating in the SCT"
  }
  
  Quest8 = {
    :ID => "8",
    :Name => "New Side Hobby: Postman",
    :QuestGiver => "Amanda",
    :Location0 => "Jadevik City",
    :Location1 => :Location0,
    :QuestDescription => "Out of convenience, Amanda has asked you to deliver a package to Bruno in Jadevik City. You'll need to cross through Route 4, Telgior Mines and Route 5."
  }
  
  Quest9 = {
    :ID => "9",
    :Name => "Dancing for Nectar",
    :QuestGiver => "Junkarian Florist",
    :Location0 => "Junkar City",
    :Location1 => :Location0,
    :QuestDescription => "There's a Pokémon called Oricorio that can make use of the special flower nectar grown by a florist in Junkar City. If you show her an Oricorio, she'd be willing to sell you the nectar."
  }
  
  Quest10 = {
    :ID => "10",
    :Name => "The Power of Song and Dance",
    :QuestGiver => "Guitar Maker",
    :Location0 => "Jadevik City",
    :Location1 => :Location0,
    :QuestDescription => "The Spiky-Ear Pichu's ukulele has been repaired, but it seems like that is only the first step to help find its friend. Perhaps it could call forth its friend with the help of dancers."
  }
  
  Quest11 = {
    :ID => "11",
    :Name => "Feelings of Gratitude",
    :QuestGiver => "Giltbert",
    :Location0 => "Gardenia Town",
    :Location1 => :Location0,
    :QuestDescription => "Giltbert has asked you to find him the Pokémon of Gratitude, supposedly found in flower fields. If you show it to him, he'll share with you a reward."
  }
  
  Quest12 = {
    :ID => "12",
    :Name => "The Strange Meteor",
    :QuestGiver => "Old Lady",
    :Location0 => "Meteor Hills",
    :Location1 => :Location0,
    :QuestDescription => "The old lady near the meteor in Junkar City has asked you to investigate Meteor Hills, following a tremor. If you find anything noteworthy there, be sure to show it to her for a reward."
  }
  
  Quest13 = {
    :ID => "13",
    :Name => "The Barefisted Spunky Punk!",
    :QuestGiver => "Emilia",
    :Location0 => "Zimbani Gym",
    :Location1 => :Location0,
    :QuestDescription => "Having taken care of all her administration work, Emilia is ready to hand you her Gym Badge... after a rematch.",
    :RewardString => "Gym Badge"
  }
  
  Quest14 = {
    :ID => "14",
    :Name => "The Lonely Lighthouse Beacon",
    :QuestGiver => "Rosy's Caretaker",
    :Location0 => "Jadevik Lighthouse",
    :Location1 => :Location0,
    :QuestDescription => "The caretaker of Rosy, the Jadevik Lighthouse's source of light, has asked you to provide her with some company. Show Rosy a Mareep, Flaaffy, or Ampharos to brighten her day."
  }
  
  Quest15 = {
    :ID => "15",
    :Name => "The Love Confession",
    :QuestGiver => "Lover Boy",
    :Location0 => "Zimbani City",
    :Location1 => :Location0,
    :QuestDescription => "A man in Zimbani City has asked for your help with proposing to his girlfriend. He requests that you give him a Spinda with a heart pattern. He will trade you the Spinda for a reward."
  }
  
  Quest16 = {
    :ID => "16",
    :Name => "The Hypnotist",
    :QuestGiver => "Sleepless Black Belt",
    :Location0 => "Towngor City",
    :Location1 => :Location0,
    :QuestDescription => "A restless man in Towngor City has asked you to show him a Pokémon knowing the move Hypnosis to help him fall asleep. If you present him with one, he'll give you a reward."
  }
  
  Quest17 = {
    :ID => "17",
    :Name => "The Shroom Maniac",
    :QuestGiver => "Poké Maniac",
    :Location0 => "Helianthus Poké Fan Club",
    :Location1 => :Location0,
    :QuestDescription => "An enthusiastic Pokémon fan from the Helianthus Poké Fan Club proclaimed his love for Shroomish to you. Perhaps something will happen if you show him one."
  }
  
  Quest18 = {
    :ID => "18",
    :Name => "The Trick to Victory",
    :QuestGiver => "Super Nerd",
    :Location0 => "R2-Yoko Gate",
    :Location1 => :Location0,
    :QuestDescription => "A Super Nerd has asked you to catch and show him a Yanma in Yoko Forest. He says he'll give you something useful for your journey if you do."
  }

end

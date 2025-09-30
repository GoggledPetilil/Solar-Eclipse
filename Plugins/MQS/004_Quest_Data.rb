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
    :QuestDescription => "A scientist in the Sol Research Lab has shared with you information on a flute that could summon a Pokémon of the cosmos. To restore the flute to it's full power, he's asked you to show him the Elite Four for research.",
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
    :Name => "These boots were made for walking",
    :QuestGiver => "Musician #1",
    :Stage1 => "Listen to the musician's, uhh, music.",
    :Stage2 => "Find the source of the power outage.",
    :Location1 => "nil",
    :Location2 => "Celadon City Sewers",
    :QuestDescription => "A musician was feeling down because he thinks no one likes his music. I should help him drum up some business."
  }
  
  Quest9 = {
    :ID => "9",
    :Name => "Got any grapes?",
    :QuestGiver => "Duck",
    :Stage1 => "Listen to The Duck Song.",
    :Stage2 => "Try not to sing it all day.",
    :Location1 => "YouTube",
    :QuestDescription => "Let's try to revive old memes by listening to this funny song about a duck wanting grapes.",
    :RewardString => "A loss of braincells. Hurray!"
  }
  
  Quest10 = {
    :ID => "10",
    :Name => "Singing in the rain",
    :QuestGiver => "Some old dude",
    :Stage1 => "I've run out of things to write.",
    :Stage2 => "If you're reading this, I hope you have a great day!",
    :Location1 => "Somewhere prone to rain?",
    :QuestDescription => "Whatever you want it to be.",
    :RewardString => "Wet clothes."
  }
  
  Quest11 = {
    :ID => "11",
    :Name => "When is this list going to end?",
    :QuestGiver => "Me",
    :Stage1 => "When IS this list going to end?",
    :Stage2 => "123",
    :Stage3 => "456",
    :Stage4 => "789",
    :QuestDescription => "I'm losing my sanity.",
    :RewardString => "nil"
  }
  
  Quest12 = {
    :ID => "12",
    :Name => "The laaast melon",
    :QuestGiver => "Some stupid dodo",
    :Stage1 => "Fight for the last of the food.",
    :Stage2 => "Don't die.",
    :Location1 => "A volcano/cliff thing?",
    :Location2 => "Good advice for life.",
    :QuestDescription => "Tea and biscuits, anyone?",
    :RewardString => "Food, glorious food!"
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

end

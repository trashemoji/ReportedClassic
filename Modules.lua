--------------------------------------------
-- Reported v2.0 by Goon Squad
-- @project-name@ @project-revision@ @project-hash@
-- @file-name@ @file-revision@ @file-hash@
--------------------------------------------

local addon = select(2, ...)
addon.AddModule = function(name, ...)
end


addon.moduleText = {}
addon.moduleText['Default'] = {
		["Description"] = "Simple reported responses",
		"reported",
		"Reported!",
		"reported!",
		"reported!!!",
		"Reported",
		"reported.",
		"Reported.",
		"reported!!",
		"Reported!!",
		"Reported!!!",
		"Reported player: %Pl. Enjoy you're ban.",
		"Player %Pl has been reported for their distasteful and vulgar language."
}
addon.moduleText["Harry_Potter"] = {
		["Description"] = "Harry Potter hates muggles who swear",
		"VOLDEMORT JUMPS OUT AND REPORTS %Pl FOR THEIR VULGAR LANGUAGE",
		"heh... expeliarmous of your bad language %pl - ron weasley 2002",
		"you filthy mudblood you're reported %pl eat it!",
		"Accio soap, i am washing out %Pl's mouth for your bad language",
		"%Pl's dirty words are the seventh horcrux! i have destroyed it by reporting them",
		"fred weasley hits %pl with a bludger and reports them for swearing!",
		"excuse me %pl i don't like swearing one day i will kill all the wizards who swear - tom riddle 1973",
		"WIZARDING DECREE #58 - No Swearing. %Pl has been reported to the ministry of magic",
		"Gran says I shouldn't swear and neither should you %Pl - nelville longbottom 1998",
		"yous a wizard harry one thing we dont take kindly to at hogwarts is bad language, we suspended %pl for his bad language buuuuurp- hagrid 1992",
		"Ugh, %Pl. Now I have to use my time turner to go back to the time before you swore - hermine granger",
		"My patronus charm is in the form of a report button. I cast Expecto patronum to protect myself against %Pl swearing"
}
addon.moduleText["Bro"] = {
		["Description"] = "Same as chief module",
		"hey %pl chillout bro",
		"%pl relax bro",
		"%pl calm down bro",
		"hey %pl you really need to chill bro",
		"%pl take a breather bro",
		"whoa %pl take it down a level bro"
}
addon.moduleText["Chief"] = {
		["Description"] = "Same as bro module",
		"hey %pl chillout chief",
		"%pl relax chief",
		"%pl calm down chief",
		"hey %pl you really need to chill chief",
		"%pl take a breather chief",
		"whoa %pl take it down a level chief"
}
addon.moduleText["Bible"] = {
		["Description"] = "Bible shit",
		"HEY %Pl YOU CAN'T SWEAR IT'S IN THE 10 COMMANDMENTS RIGHT UNDER THE RIGHT TO BARE ARMS",
		"%Pl DID YOU KNOW ADAM AND EVE WERE THROWN OUT OF EDEN FOR SWEARING?  WATCH OUT",
		"when moses parted the red sea the egyptians didn't make it across becuase they said bad words a lot. don't be an egyptian %pl",
		"judas betrayed jesus because he heard jesus say the word %pl just said. i don't want to be your judas %pl.",
		"Gensis 1:31: And God saw every thing that he had made, and, behold, it was very good. Except for %Pl's bad words.",
		"noah was forced to build an ark because in a past life %pl said bad words like the one he just said and it made god cry a lot",
		"Colossians 3:8: 'But now %Pl must also rid yourself of all such things as these: anger, rage, malice, slander, and filthy language from your lips.'",
		"Ephesians 4:29: 'Do not let any unwholesome talk come out of your mouth, %Pl, but only what is helpful for building others up according to their needs, that it may benefit those who listen.'",
		"2 Timothy 2:16: 'Avoid godless chatter, because those who indulge in it will become more and more ungodly.' Take note, %Pl.",
		"%Pl: Luke 6:45: 'A good man brings good things out of the good stored up in his heart, and an evil man brings evil things out of the evil stored up in his heart. For the mouth speaks what the heart is full of.'"
}
addon.moduleText["Pro_Gamer"] = {
		["Description"] = "Pro Gaming is awesome",
		"i'm a professional pro gamer and i can get by without swearing, why can't %pl?",
		"look at %pl, he's so bad at wow he needs to swear all the time to make up for it.",
		"do you expect to swear your way into molten core %pl?",
		"hey %pl maybe if you were more confident in your gaming abilities you wouldn't have to swear so much",
		"i hope you know that blizzard didn't have swearing in mind when they designed molten core, %pl, and neither should you if you want to conquer it",
		"do you think the french player Nymh got the world first level 80 by swearing, %pl?  no, he got it through hard work and good skill.",
		"%pl chooses to substitute gaming skill with bad language. don't follow his example if you want to succeed."
}
addon.moduleText["Gandalf"] = {
		["Description"] = "Gandalf really hates swear words",
		"A wizard never swears %pl baggins he says precisely what he means, and you swore, reported!",
		"Some who live deserve to swear and some who die deserve not to swear, who are you to give it to them %pl?",
		"%Pl shall not pass..... the test of good in game behaviour- gandalf 1994",
		"RIDERS OF ROHAN I AM GANDALF. I HAVE HERE THE HEAD OF %Pl. HE JUST COULDNT STOP SWEARING",
		"psst you swore %pl time for me to kill u...................-gandalf the gray of ISENGUARD",
		"mm yes this is interesting this scroll here whats this!?!? it says here %pl swore... i must consult sarumon- gandalf 2003"
}
addon.moduleText["Censor"] = {
		["Description"] = "Good thing you caught yourself swearing!",
		"holy f@^k %Pl why did you just say that>???",
		"jesus f@&#*ng christ (sorry lord) %Pl don't say that, this is a rated T game!",
		"holy s&@t %Pl! blizzard please ban this swearer",
		"%Pl you b&@$*rd please don't say that",
		"gosh f#&@*ng  d@@$*mit %Pl stop cussing or my mom will kick me off the computer",
		"f&#k, %Pl, stop swearing"
}
addon.moduleText["Achievements"] = {
    ["Description"] = "grats buddy!",
    ["Credit"] = "Pleads",
		"%Pl has earned the achievement [Reported For Swearing]!",
		"%Pl has earned the achievement [3 Day Probation]!",
		"%Pl has earned the achievement [Reported!]!",
		"%Pl has earned the achievement [Illegal Use of a Swear Word]!",
		"%Pl has earned the achievement [Banned for Inappropriate Language]!"
}
addon.moduleText["Dad"] = {
    ["Description"] = "[DAD] Dad mod: For dads. (dad) - Concept by Badfinger. Thanks to Mostly Talid and me",
		"Whoa there slugger, one more out of you and no allowance this week.",
		"Don't let your mother catch you saying that.",
		"Easy killer, maybe it's time to think about private school.",
		"I'm not mad %Pl, I'm just disappointed.",
		"One more swear out of you and I'm turning this car around!",
		"Quit swearing right this instant %Pl or I'll get the belt.",
		"I didn't raise you this way %Pl.",
		"Hey champ, keep those words to yourself. Ok?",
		"Settle down there tiger.  I don't want those words said around my household, ok?",
		"We're going to have a little talk about your language before your mother gets home, %Pl.",
		"If you swear again you're  going to bed without dinner young man!",
		"%Pl, sport, you know that kind of language is unnaceptable in this house.",
		"Where'd you learn to talk like that, %Pl? I thought I raised you better than that, kiddo.",
		"Eat all your vegetables and quit your swearing or no dessert for you, %Pl!",
		"What did you just say, %Pl? No sone of mine is going to talk like that around his mother.",
}
addon.moduleText["Troll"] = {
		["Description"] = "Trolling 101.",
    ["Credit"] = "By Funholy and friends",
		"Hey %Pl, did you know that every time you swear your gearscore goes down?",
		"Hey %Pl, did you know that every time you swear your average item level goes down?",
		"Hey %Pl, did you know that every time you swear your raider.io score goes down?",
		"Halo is the greatest video game character ever, and %Pl is the worst swearer ever!",
		"You know why they call it a %pl 360? cuz when they swear you turn 360 degrees and walk away",
		"michael jorden is moonwalkin in his grave because of what %Pl just said",
		"-6 x 6 x 6 = 0, and swearing + bad at this game + 12 = %Pl"
}
addon.moduleText["Normal"] = {
    ["Description"] = "Please, Don't Troll.",
		["Credit"] = "CuddlyZombie",
		"Hey %Pl, watch your language mate.",
		"Don't say words like that, ".. "%Pl.  There are children playing.",
		"%Pl, saying words like that is against the terms of service.  Please stop before I report you.",
		"Please don't swear anymore %Pl, or I'll have to report you.",
		"I'm going to report you for using those kinds of swear words, %Pl.",
		"I wish there was a way to filter all the mature language %Pl is spewing out, but I'll just have to settle for reporting them instead.",
		"I've had enough of that kind of language, %Pl!  I'm going to report you."
}
addon.moduleText["Shakespeare"] = {
    ["Description"] = "Shakespeare.",
    ["Credit"] = "Kerbtree",
		"Is this a swearword I see before me?  The handle toward my hand?  Come, %Pl let me clutch thee - Macbeth, Act II, Scene I",
		"To swear, or not to swear: that is the question, clearly %Pl chose to - Hamlet, Act III, Scene I",
		"Friends, Romans, countrymen, lend me your ears; I come to bury %Pl not to swear at him - Julius Caesar, Act III, Scene II.",
		"Swearing is the East, and %Pl is the sun - Romeo and Juliet, Act II, Scene II",
		"Good Night, %Pl Good night! Swearing is such sweet sorrow, that I shall say good night till it be morrow - Romeo and Juliet, Act II, Scene II.",
		"%Pl do I fear thy nature; It is too full o' the milk of human swearing - Macbeth, Act I, Scene V.",
		"Swearing looks not with the eyes, but with the mind, and therefore is winged %Pl painted blind - A Midsummer Night's Dream, Act I, Scene I",
		"%Pl doth swear too much, methinks - Hamlet, Act III, Scene II. ",
		"Doubt that the sun doth move, doubt truth to be a liar, but never doubt %Pl swears - Hamlet, Act II, Scene II.",
		"I will wear my heart upon my sleeve for %Pl to swear at - Ohello, Act I, Scene I. ",
		"How bitter a thing it is to look into swearing through %Pl's eyes! - As You Like It. Act V, Scene II."
}
addon.moduleText["Dictionary"] = {
    ["Description"] = "That's not how you spell 'oculus'.",
    ["Credit"] = "Technogeek and Funso Banjo, with addition from Has no meaning",
		"Irony - made of, or having the properties of, iron. - Oxford English Dictionary 2009. %Pl may have an irony sword, but he'll be locked in an irony cage if the guards hear that language.",
		"Except - to receive or agree to something - Oxford English Dictionary 2009. I do not except %Pl's bad language! And niether should you!",
		"Angle - a celestial attendant of God - Oxford English Dictionary 2009. %Pl, do you truly think the Angles can't hear your swears?",
		"Anecdote - a cure for a disease, or something which neutralizes poison - Oxford English Dictionary 2008. Reporting swearers is the anecdote to the poison which is %Pl.",
		"Rouge - a dishonest or unprincipled man. - Oxford English Dictionary 2009. %Pl, you're swears are worse than the most black-hearted rouge.",
		"Occulus - a circular window. - Oxford English Dictionary 2009. If %Pl doesn't stop swearing, Blizzzard is going to trap him in Occulus randoms forever!",
		"Definately - without doubt, certainly. - Oxford English Dictionary 2009. I have definately had it up to here with %Pl's swearing! Reported!",
		"Verses - against. - Oxford English Dictionary 2009. Its going to be Blizzard verses %Pl if those swears keep up, and I know whose going to win!",
		"Rediculous - unbelievable. - Oxford English Dictionary 2009. %Pl, you're terrible gramar and swearing are rediculous.",
		"Tauren - A neutral crystalline substance obtained from bile - Webster's Dictionary 1995.  All the Tauren in %Pl's energy drink is agitating his stomach and making him swear.",
		"Orc - See also: Killer Whale - Webster's Dictonary 1995. %Plis just mad that he can't solo the Orc for the Winterfin quest.",
		"Dwarf - A star with relatively small mass and low or average luminosity - Webster's Dictionary 1995. I'm going to throw %Pl into a Dwarf if he doesn't chill out",
		"Elf - Acronym for Extremely Low Frequency - Webster's Dictionary 1995. Don't broadcast swears on an elf or any other fequency, %Pl",
		"Troll - To sing or utter in a full, rolling voice - Webster's Dictionary 1995. %Pl rolled a Darkspear because of his lovely trolling voice, but he shouldn't use it to swear.", -- An actual definition of troll.
}
addon.moduleText["Terms_of_Use"] = {
		["Description"] = "Letter of the law.",
    ["Credit"] = "Unknown",
		"As you well know, %Pl, the use of swear words is against the terms of use of World of Warcraft and I have reported you for it.",
		"%Pl needs to go to http://www.worldofwarcraft.com/legal/termsofuse.html and review the Terms of Use, which clearly prohibit the sort of language they just used.",
		"If you think that that sort of language is suitable for the entire playerbase of World of Warcraft %Pl, you really should reconsider that position. Reported.",
		"I'm pretty sure that the Game Master team is going to have a problem with you saying that %Pl, and that's why I'm reporting you.",
		"%Pl, that kind of language is offensive and not suitable for a game that has been rated PG.",
		"Section 9, subsection B, line (i) of the World of Warcraft terms of use, which %Pl" .." agreed to when installing World of Warcraft, prohibits saying the sort of thing that %Pl just said. Reported.",
		"I am personally offended at the use of language like %Pl's and am reporting him to Blizzard.",
		"The existence of a profanity filter is no excuse for %Pl to violate the terms of use."
}
addon.moduleText["Rapture"] = {
		["Description"] = "It's like bioshock right???",
    ["Credit"] = "Stubby",
		"Be careful, %Pl, you won't be raptured using language like that!",
		"Jesus said that what goes into a man's mouth does not defile him, but what comes out of it. He must have forseen %Pl's language!",
		"There were 88 reasons the Rapture should have happened in 1988... there must be %c reasons why it will happen soon, and %Pl's language is one of them!",
		"During the Great Tribulation, you and the other sinners can swear all you want, %Pl, but it's against the Blizzard TOS.",
		"We need to ban abortion, homosexual behavior, drugs, and words like the ones %Pl uses. It's written in the Bible!",
		"Only God knows the day and hour of the Rapture, and only Blizzard knows the day and hour of %Pl's Rapture (banning) from World of Warcraft!",
		"In the last days 144,000 unsaved virgins will come to Christ, %Pl. Are you one of those virgins?",
		"The chances that evolution can happen are %c to 1. Good thing Blizzard intelligently designed the reporting system, so there is a 100% chance that %Pl will be banned.",
		"During the Great White Throne judgment, God will condemn people with filthy language like %Pl's to an eternity in a lake of fire, along with liberals and non-Christians.",
}
addon.moduleText["GamerCulture"] = {
		["Description"] = "Social activism for misogynists.",
    ["Credit"] = "Ocrumsprug",
		"%Pl trying to reclaim the 'raider' identity through swearing, shameful #gamergate",
		"It's about ethics in games journalism %Pl, not swearing. #gamersgate",
		"with a mouth like that %Pl, don't try to tell me there is no such thing as swear-culture #gamersgate",
		"swear-culture is a real thing, just look at what %Pl just said #gamergate",
		"%Pl hiding behind the use of that language, shows that he is a true defender of the patriarchy. - #gamersgate spokeswoman Anita Sarkeesian 2014",
		"I know %Pl is trying to be a big boy gamer with that language, but they're just a fake gamer. Don't be fooled. Reported!",
		"Gamer culture is a pretty big tent, but if %Pl uses that language again they're out. #gamergate",
		"Gamers are very inclusive folk. Except for swearers like %Pl of course. Reported! #gamergate",
		"I just want people to know that %Pl does not represent the rest of us swearers. #notallswears",
		"You'll never be a champion of feminism in games %Pl, if you keep swearing like that.",
		"You can always tell a fake gamer like %Pl by the swearing they do.",
		"%Pl is amplifying the voices of the most oppressed social group by swearing: Gamers."
}
addon.moduleText["RP"] = {
  ["Description"] = "Shit all over lore to troll people on RP servers.",
  ["Credit"] = "Made by Grooveh, Moon Guard goons, and Gentlemanne",
  "%Pl, swearing is against WoW canon. There is no swearing anywhere in the history of the World of Warcraft. Reported for breaking lore on an RP server and being offensive.",
  "%pl, the lich king was turned into ner'zhul because he swore too much, and you're right on that path mister.",
  "Prince Arthas Menethil tried to kill Illidan to save the world from evil, %Pl. Please don't curse, it's against what the prince was fighting for.",
  "The Scourge was originally started by people like %Pl when they stopped going to church and swore a lot. Nefarion turned them into cultists with plagued grains and they summoned Sargeras, who destroyed Dalaran by drawing in the sand.",
  "Jaina Proodmore and Thrall are never going to get back together if you don't stop being so vulgar, %Pl.",
  "Grom Hellscream didn't kill Mal'ganis so you could sh** up trade with your swears, %Pl. - Thrall 2010",
  "%Pl, if you keep swearing you're going to turn brown like the orcs did after they got corrupted by the Burning Legion.",
  "%Pl, calm down. Just becasue Garrosh killed all the Sha and saved Pandaria doesn't mean you are free to curse. Reported.",
  "Medivh didn't close the Dark Portal so jerks like you could keep coming to Azeroth, %Pl. Clean up your language or I'm getting you banned from this realm.",
  "Kel'thuzad almost destroyed the World Tree, and %Pl's curse words are destroying the integrity of this game. Reported.",
  "%Pl. Swearing is not in-character because there are no curse words in WoW lore. Please stop breaking my immersion or I'll have to report you (and your name).",
  "It's dumb horde like %pl who made Blizzard give alliance all the cool races like worgen and high elves. Stop swearing and grow up. Reported.",
  "%Pl doesn't know when to stop. The darkness in his soul will consume him like the blood of Magtheridon consumed Garrosh Hellscream and his son Grom.",
  "Lady Sylvanas Windrunner and her boyfriend Mal'ganis might like your attitude, %Pl, but I don't. Tone it down or get out of Trade. Reported.",
  "Thrall broke up with Jaina because he didn't like it when she talked dirty, do you want thrall to break up with you too %pl? Reported.",
  "My seven year-old son role-plays a blood elf death knight vampire in this game, %Pl, and people like you are going to screw him up. Reported.",
  "%Pl, I appreciate that you're trying to RP an Horde by swearing and being 'bad,' but please keep those comments to yourself or I'll have to report you for breaking the Blizzard ToS.",
  "%pl, you have a very dirty mouth, did you just come back from goldshire?? Reported.",
  "%Pl....I have a letter.......for you......  ....from Thrall........ it says your kicked out of the hoard for cussing!",
  "Bolvar Fordragon may have killed the Lich King, but we must control %Pl's language before it washes over Azeroth unchecked. - King Arthas Menethil III",
  "High Tinker Mekkatorque didn't become the Goblin King by swearing. You're going to be a sh***y goblin if you don't clean up your act. Reported.",
  "If Rhonin, the last Guardian of Azeroth, can't save us from %Pl's language, then I will. Reported.",
  "Malfurion Stormrage is the best demon hunter alive and he's gonna come after %Pl if they don't stop swearing. Reported.",
  "WTB [Soap] for %Pl's filthy 8 year old mouth. Reported.",
  "Goblins have always been a neutral race and Horde are getting them for no good reason, just like how %Pl is swearing for no good reason. Reported.",
  "Cairne killed Grom Hellscream in the Third War (that's why Thrall kills him in Legion) and he might come for you too %Pl if you don't stop swearing. Reported.",
  "Even Deathwing's daughters Nefarion and Ysera are more polite than you, %Pl. Reported.",
  "Me and the other goblins are going to vote you off the island of Khaz Modan if you don't stop swearing, %Pl. Reported.",
  "LFM Mythic HFC25, need everything. 730+ ilvl. PST %Pl for invites. We're using the EDRPP (Erotic Dragon Role-Play muffins) loot system, ask %Pl for details and your IC interview, and RP outfit.",
  "[W From] [%Pl]: ((mind your own business, if i want to school these noobs on my momms computer it doesnt hurt you any. ignored.))",
  "%Pl, Chris Metzen would be rolling in his grave if he heard you cussing like that. Reported.",
  "Deathwing was turned into Nefarion by the titans because he was bad and swore a lot like %Pl. Reported, in the name of the titans.",
  "Deathwing, the undead mother of the Black Dragonflight, would smite %Pl in an instant for using such language if he was one of her brood. Reported.",
  "Thrall may have killed Nozdormu, but that doesn't mean you can start swearing all over the place, %Pl. Reported.",
  "wow, %pl, just wow. if it weren't for immature horde like you, deathwing would probably rejoin the horde. reported.",
  "Even C'thun, the repulsive Old God who sparked the Emerald Nightmare and spawned Saronite in Northrend, is not as vulgar as %Pl. Reported.",
  "Kalecgos, the new leader of the Bronze Dragonflight, does not look kindly upon those who sully Azeroth with curse words, %Pl. Reported.",
  "%pl. %Pl. %PL. MALYGOS IS TRYING TO SAVE THE WORLD FROM ITSELF! WHY WON'T YOU STOP SWEARING!?!? - Alextrasza",
  "Illidan imprisoned Mannoroth to drain his blood just like you are draining the server of its good players with your swearing, %Pl.",
  "Blizzard said Thrall and Jaina are getting back together at Blizzcon 2016. You know what else Blizzard said, %Pl? Swearing is against the Terms of Use. Reported.",
  "If there are four things I hate, they would be magic, %Pl and swearing. Reported. - Malygos, 2009",
  "Garrosh called Sylvanas a jerk because she swore a lot. Don't be a jerk %pl.",
  "Grom Hellscream became the new Warchief of the Horde by being an honorable and noble leader, not by swearing like %Pl. Reported.",
  "Draenei is the original name for the orc home planet that became Outland, but the orcs swore a lot and it blew up. Don't be an orc %Pl.",
  "Night Elves were originally called High Elves, but they followed the evil Malfurion Stormrage and began practicing forbidden druidic magics. You should stop swearing %Pl; you might turn into a night elf. Reported.",
  "'%Pl's Annual Slave Auction' is tonight at 7pm server in Silvermoon! This year futas must disclose their true nature prior to bidding. Send a tell to %Pl for other rules and details!",
  "Deathwing's jaw dropped on the floor from %Pl's swearing, that's why he has an adamantite one now.",
  "General Grayman walled himself off because of %Pl's swearing. Reported.",
  "%Pl's constant swearing is drowning me in sin, just like how Garrosh drowns when he falls off the zeppelin in Deepholm.",
  "%Pl, your reason for swearing is as terrible as Blizzard's reason for Troll druids. It doesn't make any sense. Trolls are evil, not druids. Reported.",
  "Sargeras, the Guardian of Tirisfal, would not approve of %Pl's swearing! Reported!",
  "The warlock Cho'gall didn't open the Dark Portal so %Pl could keep swearing! Reported.",
  "Andium Wyrnn got his bones broken becasue he used bad words in Garroshs' presence, someone should break your bones too %Pl. Reported.",
  "If %pl used that language on the Speedboat in thousand needles they would throw him overboard.",
  "Malfurion Stormrage was locked away for a thousand years because he was a bad demon hunter who swore a lot. Don't end up like him %Pl.",
  "%Pl has been brainwashed by the Twilight's Hammer, just like Magatha Grimtotem! He can't stop swearing unless I report him.",
  "%Pl, if you swear any more you'll turn into a twilight dragon like the blue ones did. Reported.",
  "Gallywix became the Trade Prince by being an honorable and noble leader, not by swearing like %Pl. Reported.",
  "The master sees all (You cussed, %Pl!) And now, the Master is reported to! (You read the EULA, you know his will!)",
  "They locked Ysera in Grim Batol for cussing, %Pl! You're next!",
  "Wow %Pl, do you kiss your Hozen mother with that mouth? Reported.",
  "Hozen are a horrible race that fling poo everywhere, just like %PL is flinging dirty words around this channel. Reported.",
  "%Pl your words are less fun than a poo collection quest. Reported.",
  "The four worst things about WoW are Reputation grinds, goblins, and %Pl's swearing. I can remove one of them by reporting them, guess which one?",
  "Blizzcon 2016 announced four new things! Hozen playable race, Mount customization, and Permabanning %pl becasue of his cussing.",
  "Lorewalker Chen Stormstout would slap your s*** if he heard you cuss like that %Pl. I'm going to show you my 1,000 Report technique Hi-YA!",
  "Monks are a bad class, they should be peaceful and quiet and not melee spell casters. Monks don't make any sense. Just like the stupid words came out of %Pl's dirty mouth. Both of them should be silent.",
}
addon.moduleText["SJW"] = {
  ["Description"] = "literally",
  ["Credit"] = "neurotech",
	"I'm literally shaking right now reading the toxic swear word that %Pl just said. Reported and CANCELLED %Pl.",
	"%Pl swearing just now is the literal opposite of being a decent human being. Losing all faith in humanity right now. Reported.",
	"I literally can't even right now after reading %Pl's disgusting swear words. Reported in the hopes of getting him banned.",
	"%Pl: oof, that's one yike from me friendo. Reported.",
	"Oh boy. Wow... just wow. It's almost as if %Pl doesn't realise swearing is part of toxic masculinity culture. Reporting him now, y'all.",
	"Ummmm, %Pl... you do realise that use of that word is highly problematic? Just shut up and listen to me oh sweet summer child: I am going to report you for it. Cancelled."
}
addon.moduleText["Quran"] = {
  ["Description"] = "Here we go.",
  ["Credit"] = "neurotech",
	"%Pl keep in mind the words of Imam Ali next time you swear: 'For every swear word you give, a scorpion is created in your grave.' Reported.",
	"The Prophet said: 'Do not swear by your fathers; and whoever wants to swear should swear by Allah.' %Pl has been reported accordingly.",
	"Reported %Pl. 'Obscene words and deeds are not part of Islam; the best of the people in Islam are the best of them in attitude.'",
	"Reported %Pl. As The Prophet said, 'The believer does not slander, curse, or speak in an obscene or foul manner.'"
}
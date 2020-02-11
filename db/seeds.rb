Town.destroy_all
Interaction.destroy_all
Player.destroy_all
Npc.destroy_all
Quest.destroy_all
Relationship.destroy_all

riften = Town.find_or_create_by(name: "Riften", jarl: "Jarl Laila Law-Giver")
windhelm = Town.find_or_create_by(name: "Windhelm", jarl: "Jarl Ulfric Stormcloak")
winterhold = Town.find_or_create_by(name: "Winterhold", jarl: "Jarl Korir")
whiterun = Town.find_or_create_by(name: "Whiterun", jarl: "Jarl Balgruuf the Greater")
falkreath = Town.find_or_create_by(name: "Falkreath", jarl: "Jarl Siddgeir")
markarth = Town.find_or_create_by(name: "Markarth", jarl: "Jarl Igmund")
dawnstar = Town.find_or_create_by(name: "Dawnstar", jarl: "Jarl Skald the Elder")
morthal = Town.find_or_create_by(name: "Morthal", jarl: "Jarl Idgrod Ravencrone")
solitude = Town.find_or_create_by(name: "Solitude", jarl: "Jarl Elisif the Fair")

### MARKARTH NPCS ###
vorstag = Npc.find_or_create_by(name: "Vorstag", town_id: markarth.id, description: "Vorstag is sitting by the fire in the Silver-Blood Inn.")
markarth_guard = Npc.find_or_create_by(name: "Markarth Guard", town_id: markarth.id, description: "Markarth Guard is leaning against a market stall.")
markarth_jarl = Npc.find_or_create_by(name: "Jarl Laila Law-Giver", town_id: markarth.id, description: "Jarl Laila Law-Giver is sitting confidently on her throne.")
calcelmo = Npc.find_or_create_by(name: "Calcelmo", town_id: markarth.id, description: "Calcelmo is hunched over an enchanting table reading spell books.")

### DAWNSTAR NPCS ###
capt_wayfinder = Npc.find_or_create_by(name: "Captain Wayfinder", town_id: dawnstar.id, description: "Captain Wayfinder is buying supplies for his next maritime voyage.")
dawnstar_guard = Npc.find_or_create_by(name: "Dawnstar Guard",  town_id: dawnstar.id, description: "Dawnstar Guard is patrolling the streets of Dawnstar.")

### RIFTEN NPCS ###
riften_guard = Npc.find_or_create_by(name: "Riften Guard",      town_id: riften.id,   description: "I used to be an adventurer just like you, then I took an arrow to the knee.")
riften_edda_beggar = Npc.find_or_create_by(name: "Edda",        town_id: riften.id,   description: "Please can you spare a septim or two?")
riften_maven = Npc.find_or_create_by(name: "Maven Black-Briar", town_id: riften.id,   description: "the head of the Black-Briars")

### WHITERUN NPCS ###
whiterun_nazeem = Npc.find_or_create_by(name: "Nazeem",         town_id: whiterun.id, description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't.")
whiterun_guard = Npc.find_or_create_by(name: "Whiterun Guard",  town_id: whiterun.id, description: "Disrespect the law, and you disrespect me.")
whiterun_heimskr = Npc.find_or_create_by(name: "Heimskr",       town_id: whiterun.id, description: "You have come! You have come to hear the word of Talos! The truth, child of Talos, is that the Dragon's children have come to purge the world in fire and righteousness! There are those who would silence the Dragon's truth... BUT NOT I! Not Heimskr! His word will be known! He has returned... Oh, how Talos has returned. Helgen has been purged in his light. Will Whiterun be next? The Imperials silence us because they fear us! They are cowards! Cowards and fools who have forgotten the truth! ... May Talos guide you ... ")

### WINTERHOLD NPCS ###
winterhold_guard = Npc.find_or_create_by(name: "Winterhold Guard",  town_id: winterhold.id,  description: "No lollygaggin")
winterhold_ancano =  Npc.find_or_create_by(name: "Ancano",          town_id: winterhold.id,  description: "Ancano is a member of the College of Winterhold serving as advisor to the Arch-Mage. He does not socialise much with the other mages, and his presence at the college is highly suspicious.")
winterhold_tolfdir = Npc.find_or_create_by(name: "Tolfdir",         town_id: winterhold.id,  description: "He is an old, friendly mage. Despite his age, he is very powerful, though he never brags about it.")
#tolfdir may give a quest to kill Ancano, since Ancano (Thalmor guy) killed arch-mage???

### WINDHELM NPCS ###
windhelm_guard = Npc.find_or_create_by(name: "Windhelm Guard",      town_id: windhelm.id, description: "Let me guess... someone stole your sweetroll.")
windhelm_jarl = Npc.find_or_create_by(name: "Jarl Ulfric Stormcloack", town_id: windhelm.id, description: "the leader of the Stormcloaks and Jarl of Windhelm. Rumor has it that he shouted the high king to pieces")
windhelm_aventus = Npc.find_or_create_by(name: "Aventus Aretino",   town_id: windhelm.id, description: "An orphan boy in who has been performing the black Sacrament in order to summon the Dark Brotherhood to help him deal with someone.")
#Aventus can give a quest associated with dark_brotherhood... 

### FALKREATH NPCS ###
falkreath_sinding = Npc.find_or_create_by(name: "Sinding",      town_id: falkreath.id, description: "A prisoner in the Falkreath Jail. Imprisoned because he is a werewolf who killed a little girl")
falkreath_lod = Npc.find_or_create_by(name: "Lod",              town_id: falkreath.id, description: "A blacksmith, He sells an interesting assortment of weapons, apparel, and miscellaneous items. Missing his Dog.")
falkreath_jarl = Npc.find_or_create_by(name: "Jarl Siddgeir",   town_id: falkreath.id, description: " Jarl of Falkreath if the Imperials are in charge, leaving all the day to day administrative work to his competent steward.")
#Falkreath quests? Kill Sinding... the werewolf that escaped prison /// help Lod find his Dog ///Jarl wants you kill bandit leader

#binding.pry
0

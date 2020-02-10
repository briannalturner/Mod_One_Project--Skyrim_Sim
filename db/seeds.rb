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
dawnstar_guard = Npc.find_or_create_by(name: "Dawnstar Guard", town_id: dawnstar.id, description: "Dawnstar Guard is patrolling the streets of Dawnstar.")

### RIFTEN NPCS ###
riften_guard = Npc.find_or_create_by(name: "X-adventurer", description: "I used to be an adventurer like you...", town_id: riften.id)
riften_edda_beggar = Npc.find_or_create_by(name: "Edda", description: "spare change pls...", town_id: riften.id)
riften_maven = Npc.find_or_create_by(name: "Maven Black-Briar", description: "the head of the Black-Briars", town_id: riften.id)

### WHITERUN NPCS ###
whiterun_nazeem = Npc.find_or_create_by(name: "Nazeem", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't.", town_id: riften.id)
whiterun_guard = Npc.find_or_create_by(name: "Basic Guard", description: "Disrespect the law, and you disrespect me.", town_id: riften.id)
whiterun_Heimskr = Npc.find_or_create_by(name: "Heimskr", description: "You have come! You have come to hear the word of Talos!, The truth, child of Talos, is that the Dragon's children have come! To purge the world in fire and righteousness!, There are those who would silence the Dragon's truth! But not I! Not Heimskr! His word will be known!, He has returned... Oh, how Talos has returned. Helgen has been purged in his light. Will Whiterun be next?, and The Imperials silence us because they fear us! They are cowards! Cowards and fools who have forgotten the truth! ... May Talos guide you...", town_id: riften.id)

### WINTERHOLD NPCS ###
winterhold_guard = Npc.find_or_create_by(name: "winterhold_guard", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't.", town_id: riften.id)





binding.pry
0

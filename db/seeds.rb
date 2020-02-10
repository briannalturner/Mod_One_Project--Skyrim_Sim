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
riften = Town.find_or_create_by(name: "Riften", jarl: "Laila Law-Giver")
riften = Town.find_or_create_by(name: "Riften", jarl: "Laila Law-Giver")

#make npc for riften to falkreath
:name, :description, :town_id
riften_guard = Npc.find_or_create_by(name: "X-adventurer", description: "I used to be an adventurer like you..." town_id: riften.id)
riften_edda_beggar = Npc.find_or_create_by(name: "Edda", description: "spare change pls..." town_id: riften.id)
riften_maven = Npc.find_or_create_by(name: "Maven Black-Briar", description: "the head of the Black-Briars" town_id: riften.id)

#NPCS for windhelm
whiterun_nazeem = Npc.find_or_create_by(name: "Nazeem", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't." town_id: riften.id)
whiterun_guard = Npc.find_or_create_by(name: "Basic Guard", description: "Disrespect the law, and you disrespect me." town_id: riften.id)
whiterun_Heimskr = Npc.find_or_create_by(name: "Heimskr", description: "You have come! You have come to hear the word of Talos!, The truth, child of Talos, is that the Dragon's children have come! To purge the world in fire and righteousness!, There are those who would silence the Dragon's truth! But not I! Not Heimskr! His word will be known!, He has returned... Oh, how Talos has returned. Helgen has been purged in his light. Will Whiterun be next?, and The Imperials silence us because they fear us! They are cowards! Cowards and fools who have forgotten the truth! ... May Talos guide you..." town_id: riften.id)

winterhold_guard = Npc.find_or_create_by(name: "winterhold_guard", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't." town_id: riften.id)
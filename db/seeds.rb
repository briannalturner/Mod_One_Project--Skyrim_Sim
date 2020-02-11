Town.destroy_all
Interaction.destroy_all
Player.destroy_all
Npc.destroy_all
Quest.destroy_all
Relationship.destroy_all

### TOWNS ###
riften = Town.find_or_create_by(name: "Riften", jarl: "Jarl Laila Law-Giver")
windhelm = Town.find_or_create_by(name: "Windhelm", jarl: "Jarl Ulfric Stormcloak")
winterhold = Town.find_or_create_by(name: "Winterhold", jarl: "Jarl Korir")
whiterun = Town.find_or_create_by(name: "Whiterun", jarl: "Jarl Balgruuf the Greater")
falkreath = Town.find_or_create_by(name: "Falkreath", jarl: "Jarl Siddgeir")
markarth = Town.find_or_create_by(name: "Markarth", jarl: "Jarl Igmund")
dawnstar = Town.find_or_create_by(name: "Dawnstar", jarl: "Jarl Skald the Elder")
morthal = Town.find_or_create_by(name: "Morthal", jarl: "Jarl Idgrod Ravencrone")
solitude = Town.find_or_create_by(name: "Solitude", jarl: "Jarl Elisif the Fair")


### PLAYERS ###
bri = Player.find_or_create_by(name: "Bri", gender: "female", race: "Khajiit", money: 0)
alan = Player.find_or_create_by(name: "Alan", gender: "male", race: "Argonian", money: 0)
carl = Player.find_or_create_by(name: "Carl", gender: "male", race: "Breton", money: 0)
lauren = Player.find_or_create_by(name: "Lauren", gender: "female", race: "Redguard", money: 0)
sonata = Player.find_or_create_by(name: "Sonata", gender: "female", race: "Imperial", money: 0)
ryan = Player.find_or_create_by(name: "Ryan", gender: "male", race: "Orc", money: 0)
will = Player.find_or_create_by(name: "Will", gender: "male", race: "Wood Elf", money: 0)
paul = Player.find_or_create_by(name: "Paul", gender: "male", race: "High Elf", money: 0)
yo = Player.find_or_create_by(name: "Yo", gender: "male", race: "Dark Elf", money: 0)
wesley = Player.find_or_create_by(name: "Wesley", gender: "male", race: "Khajiit", money: 0)
matteo = Player.find_or_create_by(name: "Matteo", gender: "male", race: "Argonian", money: 0)
valentin = Player.find_or_create_by(name: "Valentin", gender: "male", race: "Nord", money: 0)
jason = Player.find_or_create_by(name: "Jason", gender: "male", race: "Wood Elf", money: 0)


### MARKARTH NPCS ###
vorstag = Npc.find_or_create_by(name: "Vorstag", town_id: markarth.id, description: "Vorstag is sitting by the fire in the Silver-Blood Inn.")
markarth_guard = Npc.find_or_create_by(name: "Markarth Guard", town_id: markarth.id, description: "Markarth Guard is leaning against a market stall.")
markarth_jarl = Npc.find_or_create_by(name: "Jarl Igmund", town_id: markarth.id, description: "Jarl Igmund is sitting confidently on his throne.")
calcelmo = Npc.find_or_create_by(name: "Calcelmo", town_id: markarth.id, description: "Calcelmo is hunched over an enchanting table reading spell books.")

### DAWNSTAR NPCS ###
capt_wayfinder = Npc.find_or_create_by(name: "Captain Wayfinder", town_id: dawnstar.id, description: "Captain Wayfinder is buying supplies for his next maritime voyage.")
dawnstar_guard = Npc.find_or_create_by(name: "Dawnstar Guard", town_id: dawnstar.id, description: "Dawnstar Guard is patrolling the streets of Dawnstar.")
dawnstar_jarl = Npc.find_or_create_by(name: "Jarl Skald the Elder", town_id: dawnstar.id, description: "Jarl Skald the Elder is discussing the civil war with her housecarl.")
alesan = Npc.find_or_create_by(name: "Alesan", town_id: dawnstar.id, description: "Alesan is playing with a wooden sword.")

### MORTHAL NPCS ###
lami = Npc.find_or_create_by(name: "Lami", town_id: morthal.id, description: "Lami is crafting potions in her alchemy shop.")
lurbuk = Npc.find_or_create_by(name: "Lurbuk", town_id: morthal.id, description: 'Lurbuk is singing "Age of Aggression" in Moorside Inn.')
morthal_jarl = Npc.find_or_create_by(name: "Jarl Idgrod Ravencrone", town_id: morthal.id, description: "Jarl Idgrod Ravencrone is muttering to herself on her throne.")
morthal_guard = Npc.find_or_create_by(name: "Morthal Guard", town_id: morthal.id, description: "Morthal Guard is watching you from his post by the gate.")

### SOLITUDE NPCS ###
dervenin = Npc.find_or_create_by(name: "Dervenin", town_id: solitude.id, description: "Dervenin is sitting on a ragged mat begging passersby for septims.")
svari = Npc.find_or_create_by(name: "Svari", town_id: solitude.id, description: "Svari is playing tag with the other children in the town square.")
solitude_jarl = Npc.find_or_create_by(name: "Jarl Elisif the Fair", town_id: solitude.id, description: "Jarl Elisif the Fair is sitting uncertainly on the throne.")
solitude_guard = Npc.find_or_create_by(name: "Solitude Guard", town_id: solitude.id, description: "Solitude Guard is patrolling the market.")


### RIFTEN NPCS ###
riften_guard = Npc.find_or_create_by(name: "Riften Guard", description: "I used to be an adventurer like you...", town_id: riften.id)
riften_edda_beggar = Npc.find_or_create_by(name: "Edda", description: "Edda is begging passersby for septims.", town_id: riften.id)
riften_maven = Npc.find_or_create_by(name: "Maven Black-Briar", description: "Maven Black-Briar is perusing the market.", town_id: riften.id)
riften_jarl = Npc.find_or_create_by(name: "Jarl Laila Law-Giver", town_id: riften.id, description: "Jarl Laila Law-Giver is sitting confidently on her throne.")

### WHITERUN NPCS ###
whiterun_nazeem = Npc.find_or_create_by(name: "Nazeem", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't.", town_id: riften.id)
whiterun_guard = Npc.find_or_create_by(name: "Basic Guard", description: "Disrespect the law, and you disrespect me.", town_id: riften.id)
whiterun_Heimskr = Npc.find_or_create_by(name: "Heimskr", description: "You have come! You have come to hear the word of Talos!, The truth, child of Talos, is that the Dragon's children have come! To purge the world in fire and righteousness!, There are those who would silence the Dragon's truth! But not I! Not Heimskr! His word will be known!, He has returned... Oh, how Talos has returned. Helgen has been purged in his light. Will Whiterun be next?, and The Imperials silence us because they fear us! They are cowards! Cowards and fools who have forgotten the truth! ... May Talos guide you...", town_id: riften.id)

### WINTERHOLD NPCS ###
winterhold_guard = Npc.find_or_create_by(name: "winterhold_guard", description: "Do you get to the Cloud District very often? Oh, what am I saying, of course you don't.", town_id: riften.id)

### INTERACTIONS ###
### markarth ###
kill_vorstag = Interaction.find_or_create_by(description: "You slice Vorstag cleanly through the chest with your blade.", npc_id: vorstag.id, bounty: 1000)
talk_vorstag = Interaction.find_or_create_by(description: "Some call me a mercenary, but I like to think of myself as a freelance adventurer for hire.", npc_id: vorstag.id)
kill_markarth_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Igmund's torso with a firebolt spell.", npc_id: markarth_jarl.id)
talk_markarth_jarl = Interaction.find_or_create_by(description: "Are you a sellsword? I don't like your kind. No honor. No loyalty. Unreliable. But I can't turn away a potential ally in these times.", npc_id: markarth_jarl.id)
kill_calcelmo = Interaction.find_or_create_by(description: "You cleave Calcelmo's head in two with your sword.", npc_id: calcelmo.id, bounty: 1000)
talk_calcelmo = Interaction.find_or_create_by(description: "You idiot. Do you even know who I am? The most recognized scholar on the Dwemer in all of Tamriel, and you people keep bothering me! I... I'm sorry I... I got too excited. I'm in the middle of some very... stressful work, and I shouldn't have yelled. How can I help you?", npc_id: calcelmo.id)

### dawnstar ###
kill_wayfinder = Interaction.find_or_create_by(description: "You slice Captain Wayfinder cleanly through the chest with your blade.", npc_id: capt_wayfinder.id, bounty: 1000)
talk_wayfinder = Interaction.find_or_create_by(description: "Everyone thinks I'm too young to be a ship's captain, but I'm going to prove them wrong. I don't buy all that talk about ship captains having to be stern and strict. I want my crewmen to enjoy their work.", npc_id: capt_wayfinder.id)
kill_dawnstar_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Skald the Elder's torso with a firebolt spell.", npc_id: dawnstar_jarl.id)
talk_dawnstar_jarl = Interaction.find_or_create_by(description: "Are you a sellsword? I don't like your kind. No honor. No loyalty. Unreliable. But I can't turn away a potential ally in these times.", npc_id: dawnstar_jarl.id)
kill_alesan = Interaction.find_or_create_by(description: "You seriously tried to kill a kid? You're sick.", npc_id: alesan.id, bounty: 1000)
talk_alesan = Interaction.find_or_create_by(description: "My parents are dead. My pa was a sailor. Took me with him on his last trip. After he got sick, they... put us off here and left without us. He... died a few days later. I've tried to make do since then, but... it's been hard. Real hard.", npc_id: alesan.id)





### guard interactions ###
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: markarth_guard.id, bounty: 1000)
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: dawnstar_guard.id, bounty: 1000)
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: morthal_guard.id, bounty: 1000)
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: solitude_guard.id, bounty: 1000)
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: riften_guard.id, bounty: 1000)
kill_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: winterhold_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: markarth_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: dawnstar_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: morthal_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: solitude_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: riften_guard.id, bounty: 1000)
talk_guard = Interaction.find_or_create_by(description: " used to be an adventurer like you, then I took an arrow in the knee.", npc_id: winterhold_guard.id, bounty: 1000)







binding.pry
0

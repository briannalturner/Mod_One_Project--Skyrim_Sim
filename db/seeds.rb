# require_relative '../bin/run.rb'
# require_relative '../app/models'
# #require_relative '../db/seeds.rb'

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
dervenin = Npc.find_or_create_by(name: "Dervenin", description: "Dervenin is sitting on a ragged mat begging passersby for septims.", town_id: solitude.id)
svari = Npc.find_or_create_by(name: "Svari", town_id: solitude.id, description: "Svari is playing tag with the other children in the town square.")
solitude_jarl = Npc.find_or_create_by(name: "Jarl Elisif the Fair", town_id: solitude.id, description: "Jarl Elisif the Fair is sitting uncertainly on the throne.")
solitude_guard = Npc.find_or_create_by(name: "Solitude Guard", town_id: solitude.id, description: "Solitude Guard is patrolling the market.")


### RIFTEN NPCS ###
riften_guard = Npc.find_or_create_by(name: "Riften Guard", description: "Riften Guard is carefully watching shoppers in the market.", town_id: riften.id)
edda = Npc.find_or_create_by(name: "Edda", description: "Edda is begging passersby for septims.", town_id: riften.id)
maven = Npc.find_or_create_by(name: "Maven Black-Briar", description: "Maven Black-Briar is perusing the market.", town_id: riften.id)
riften_jarl = Npc.find_or_create_by(name: "Jarl Laila Law-Giver", town_id: riften.id, description: "Jarl Laila Law-Giver is sitting confidently on her throne.")

### WHITERUN NPCS ###
nazeem = Npc.find_or_create_by(name: "Nazeem", description: "Nazeem is haughtily surveying the town center.", town_id: whiterun.id)
whiterun_guard = Npc.find_or_create_by(name: "Whiterun Guard", description: "Whiterun Guard is looking through the window of Belethor's shop.", town_id: whiterun.id)
heimskr = Npc.find_or_create_by(name: "Heimskr", description: "Heimskr is preaching aggressively at pedestrians.", town_id: whiterun.id)
whiterun_jarl = Npc.find_or_create_by(name: "Jarl Balgruuf the Greater", description: "Jarl Balgruuf the Greater is disussing dragons with his court wizard.", town_id: whiterun.id)

### WINTERHOLD NPCS ###
winterhold_guard = Npc.find_or_create_by(name: "Winterhold Guard", description: "Winterhold Guard is clutching his robes for warmth.", town_id: winterhold.id)
savos_aren = Npc.find_or_create_by(name: "Savos Aren", description: "Savos Aren is instructing magi at the College of Winterhold.", town_id: winterhold.id)
ancano = Npc.find_or_create_by(name: "Ancano", description: "Ancano is watching Savos Aren with distrust.", town_id: winterhold.id)
winterhold_jarl = Npc.find_or_create_by(name: "Jarl Korir", town_id: winterhold.id, description: "Jarl Korir is rambling about horkers to his housecarl.")

### WINDHELM NPCS ###
windhelm_guard = Npc.find_or_create_by(name: "Windhelm Guard", description: "Windhelm Guard is clutching his robes for warmth.", town_id: windhelm.id)
aventus_aretino = Npc.find_or_create_by(name: "Aventus Aretino", description: "Aventus Aretino is performing the Black Sacrament.", town_id: windhelm.id)
calixto_corrium = Npc.find_or_create_by(name: "Calixto Corrium", description: "Calixto Corrium is watching you out of the corner of his eye.", town_id: windhelm.id)
windhelm_jarl = Npc.find_or_create_by(name: "Jarl Ulfric Stormcloak", town_id: windhelm.id, description: "Jarl Ulfric Stormcloak is discussing making a siege on Whiterun with his housecarl.")

### FALKREATH NPCS ###
falkreath_guard = Npc.find_or_create_by(name: "Falkreath Guard", description: "Falkreath Guard is visiting Falkreath's massive graveyard.", town_id: falkreath.id)
mathies = Npc.find_or_create_by(name: "Mathies", description: "Mathies and his wife are visiting their daughter's grave.", town_id: falkreath.id)
sinding = Npc.find_or_create_by(name: "Sinding", description: "Sinding is sitting in his prison cell.", town_id: falkreath.id)
falkreath_jarl = Npc.find_or_create_by(name: "Jarl Siddgeir", town_id: falkreath.id, description: "Jarl Siddgeir is drinking wine from a large flask.")





### INTERACTIONS ###
### markarth ###
kill_vorstag = Interaction.find_or_create_by(description: "You slice Vorstag cleanly through the chest with your blade.", npc_id: vorstag.id, bounty: 1000, town_id: markarth.id, action_name: "Attack")
talk_vorstag = Interaction.find_or_create_by(description: "Some call me a mercenary, but I like to think of myself as a freelance adventurer for hire.", npc_id: vorstag.id, town_id: markarth.id, action_name: "Talk")
kill_markarth_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Igmund's torso with a firebolt spell.", npc_id: markarth_jarl.id, bounty: 1000, town_id: markarth.id, action_name: "Attack")
talk_markarth_jarl = Interaction.find_or_create_by(description: "Are you a sellsword? I don't like your kind. No honor. No loyalty. Unreliable. But I can't turn away a potential ally in these times.", npc_id: markarth_jarl.id, town_id: markarth.id, action_name: "Talk")
kill_calcelmo = Interaction.find_or_create_by(description: "You cleave Calcelmo's leg in two with your sword.", npc_id: calcelmo.id, bounty: 1000, town_id: markarth.id, action_name: "Attack")
talk_calcelmo = Interaction.find_or_create_by(description: "You idiot. Do you even know who I am? The most recognized scholar on the Dwemer in all of Tamriel, and you people keep bothering me! I... I'm sorry I... I got too excited. I'm in the middle of some very... stressful work, and I shouldn't have yelled. How can I help you?", npc_id: calcelmo.id, town_id: markarth.id, action_name: "Talk")

### dawnstar ###
kill_wayfinder = Interaction.find_or_create_by(description: "You slice Captain Wayfinder cleanly through the chest with your blade.", npc_id: capt_wayfinder.id, bounty: 1000, town_id: dawnstar.id, action_name: "Attack")
talk_wayfinder = Interaction.find_or_create_by(description: "Everyone thinks I'm too young to be a ship's captain, but I'm going to prove them wrong. I don't buy all that talk about ship captains having to be stern and strict. I want my crewmen to enjoy their work.", npc_id: capt_wayfinder.id, town_id: dawnstar.id, action_name: "Talk")
kill_dawnstar_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Skald the Elder's torso with a firebolt spell.", npc_id: dawnstar_jarl.id, bounty: 1000, town_id: dawnstar.id, action_name: "Attack")
talk_dawnstar_jarl = Interaction.find_or_create_by(description: "Are you a sellsword? I don't like your kind. No honor. No loyalty. Unreliable. But I can't turn away a potential ally in these times.", npc_id: dawnstar_jarl.id, town_id: dawnstar.id, action_name: "Talk")
kill_alesan = Interaction.find_or_create_by(description: "You seriously tried to kill a kid? You're sick.", npc_id: alesan.id, bounty: 1000, town_id: dawnstar.id, action_name: "Attack")
talk_alesan = Interaction.find_or_create_by(description: "My parents are dead. My pa was a sailor. Took me with him on his last trip. After he got sick, they... put us off here and left without us. He... died a few days later. I've tried to make do since then, but... it's been hard. Real hard.", npc_id: alesan.id, town_id: dawnstar.id, action_name: "Talk")

    
### morthal ###
kill_lami = Interaction.find_or_create_by(description: "You slice Lami cleanly through the chest with your blade.", npc_id: lami.id, bounty: 1000, town_id: morthal.id, action_name: "Attack")
talk_lami = Interaction.find_or_create_by(description: "If you need any alchemy supplies, I'll do my best to provide them. Assuming I haven't used them all up.", npc_id: lami.id, town_id: morthal.id, action_name: "Talk")
kill_morthal_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Idgrod Ravencrone's torso with a firebolt spell.", npc_id: morthal_jarl.id, bounty: 1000, town_id: morthal.id, action_name: "Attack")
talk_morthal_jarl = Interaction.find_or_create_by(description: "So, life has brought you to Morthal, and to me. What purpose this serves, we will no doubt see. Welcome.", npc_id: morthal_jarl.id, town_id: morthal.id, action_name: "Talk")
kill_lurbuk = Interaction.find_or_create_by(description: "You cleave Lurbuk's leg in two with your sword.", npc_id: lurbuk.id, bounty: 1000, town_id: morthal.id, action_name: "Attack")
talk_lurbuk = Interaction.find_or_create_by(description: "Don't fret over the gloom, there's nothing to fear! Old Lurbuk will brighten your spirits -- just lend him your ear! Try as you may, they won't say 'good day,' but will just walk away. Worry not, Morthal! Lurbuk is here to stay!", npc_id: lurbuk.id, town_id: morthal.id, action_name: "Talk")


### solitude ###
kill_dervenin = Interaction.find_or_create_by(description: "You slice Dervenin cleanly through the chest with your blade.", npc_id: dervenin.id, bounty: 1000, town_id: solitude.id, action_name: "Attack")
talk_dervenin = Interaction.find_or_create_by(description: "Tendrils of thought may wind their way through this realm, but those tendrils bind our reality together. A method to your madness and your madness is the method and the melody...", npc_id: dervenin.id, town_id: solitude.id, action_name: "Talk")
kill_solitude_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Elisif the Fair's torso with a firebolt spell.", npc_id: solitude_jarl.id, bounty: 1000, town_id: solitude.id, action_name: "Attack")
talk_solitude_jarl = Interaction.find_or_create_by(description: "With the passing of my dear husband, Torygg, the weighty position of Jarl has fallen to me. Please direct questions to my steward.", npc_id: solitude_jarl.id, town_id: solitude.id, action_name: "Talk")
kill_svari = Interaction.find_or_create_by(description: "You seriously tried to kill a kid? You're sick.", npc_id: svari.id, bounty: 1000, town_id: solitude.id, action_name: "Attack")
talk_svari = Interaction.find_or_create_by(description: "Mum doesn't say much since Uncle Roggvir died. She doesn't even go to Temple anymore. I wish she would. At least that way she'd have people to talk to.", npc_id: svari.id, town_id: solitude.id, action_name: "Talk")


### guard interactions ###
guard_dialogue_option = ["I used to be an adventurer like you. Then I took an arrow in the knee...", 
"Let me guess... someone stole your sweetroll.",
"Disrespect the law, and you disrespect",
"What do you need?",
"No lollygaggin'",
"My cousin's out fighting dragons, and what do I get? Guard duty.",
"Gotta keep my eyes open. Damn dragons could swoop down at any time",
"Fear not. Come dragon or giant, we'll be ready.",
"I'd be a lot warmer and a lot happier with a bellyfull of mead...",
"I mostly deal with petty thievery and drunken brawls. Been too long since we've had a good bandit raid.",
"Watch the skies traveler."
]
kill_markarth_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: markarth_guard.id, bounty: 1000, town_id: markarth.id, action_name: "Kill")
kill_dawnstar_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: dawnstar_guard.id, bounty: 1000, town_id: dawnstar.id, action_name: "Kill")
kill_morthal_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: morthal_guard.id, bounty: 1000, town_id: morthal.id, action_name: "Kill")
kill_windhelm_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: windhelm_guard.id, bounty: 1000, town_id: windhelm.id, action_name: "Kill")
kill_falkreath_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: falkreath_guard.id, bounty: 1000, town_id: falkreath.id, action_name: "Kill")
kill_solitude_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: solitude_guard.id, bounty: 1000, town_id: solitude.id, action_name: "Kill")
kill_riften_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: riften_guard.id, bounty: 1000, town_id: riften.id, action_name: "Kill")
kill_whiterun_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: whiterun_guard.id, bounty: 1000, town_id: whiterun.id, action_name: "Kill")
kill_winterhold_guard = Interaction.find_or_create_by(description: "You eviscerate the Guard's neck with one swipe of your sword.", npc_id: winterhold_guard.id, bounty: 1000, town_id: winterhold.id, action_name: "Kill")
talk_markarth_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: markarth_guard.id, town_id: markarth.id, action_name: "Talk")
talk_dawnstar_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: dawnstar_guard.id, town_id: dawnstar.id, action_name: "Talk")
talk_morthal_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: morthal_guard.id, town_id: morthal.id, action_name: "Talk")
talk_windhelm_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: windhelm_guard.id, town_id: windhelm.id, action_name: "Talk")
talk_falkreath_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: falkreath_guard.id, town_id: falkreath.id, action_name: "Talk")
talk_solitude_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: solitude_guard.id, town_id: solitude.id, action_name: "Talk")
talk_riften_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: riften_guard.id, town_id: riften.id, action_name: "Talk")
talk_whiterun_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: whiterun_guard.id, town_id: whiterun.id, action_name: "Talk")
talk_winterhold_guard = Interaction.find_or_create_by(description: guard_dialogue_option.sample, npc_id: winterhold_guard.id, town_id: winterhold.id, action_name: "Talk")

### Riften Interactions ###
kill_riften_jarl = Interaction.find_or_create_by(description: "You eviscerate the Jarl Laila Law-Giver's neck with one swipe of your sword.", npc_id: riften_jarl.id, bounty: 1000, town_id: riften.id, action_name: "Attack")
talk_riften_jarl = Interaction.find_or_create_by(description: "Speak. I wish to hear everything my subjects have to say.", npc_id: riften_jarl.id, town_id: riften.id, action_name: "Talk")
kill_edda = Interaction.find_or_create_by(description: "You straight up attack her.", npc_id: edda.id, goodwill: 0, town_id: riften.id, action_name: "Attack", bounty: 1000)
support_edda = Interaction.find_or_create_by(description: "You hand Edda 5 gold.", npc_id: edda.id, goodwill: 100, town_id: riften.id, action_name: "Talk")
help_maven = Interaction.find_or_create_by(description: "You help Maven by finding the double-agent stealing all of her mead!", goodwill: 100, npc_id: maven.id, town_id: riften.id, action_name: "Help")
kill_maven = Interaction.find_or_create_by(description: "You attack Maven Black Briar causing havoc in all of Riften", bounty: 1000, goodwill: 0, npc_id: maven.id, town_id: riften.id, action_name: "Attack")

### Windhelm Interactions ###
talk_aventus = Interaction.find_or_create_by(description: "Sweet mother, sweet mother, send your child unto me for the sins of the unworthy must be baptized in blood and fear.", goodwill: 0, town_id: windhelm.id, npc_id: aventus_aretino.id, action_name: "Talk")
help_aventus = Interaction.find_or_create_by(description: "You kill the cruel matron, Grelod the Kind, who abused Aventus and the other children.", goodwill: 100, town_id: windhelm.id, npc_id: aventus_aretino.id, action_name: "Help")
help_jarl = Interaction.find_or_create_by(description: "You learn of a murderer on the loose, and you eventually capture him.", goodwill: 100, town_id: windhelm.id, npc_id: windhelm_jarl.id, action_name: "Help")
kill_jarl = Interaction.find_or_create_by(description: "You kill Ulfric with your Shout... Karma", goodwill: 0, bounty: 1000, npc_id: windhelm_jarl.id, town_id: windhelm.id, action_name: "Attack")
kill_calixto = Interaction.find_or_create_by(description: "You cleave Calixto's leg in two with your sword.", npc_id: calixto_corrium.id, town_id: windhelm.id, action_name: "Attack")
talk_calixto = Interaction.find_or_create_by(description: "My sister passed away some years ago, so I settled down here and opened the House of Curiosities. I think she would be happy to know that our museum has brought smiles to faces both young and old.", npc_id: calixto_corrium.id, town_id: windhelm.id, action_name: "Talk")

### Winterhold Interactions ###
kill_savos_aren = Interaction.find_or_create_by(description: "You slice Savos Aren cleanly through the chest with your blade.", npc_id: savos_aren.id, bounty: 1000, town_id: winterhold.id, action_name: "Attack")
talk_savos_aren = Interaction.find_or_create_by(description: "Allow me to introduce myself. I am Savos Aren, Arch-Mage of the College of Winterhold. I am quite content to see nearly any aspect of magic explored and investigated here. But I do not and will not approve of any research or experiments that cause purposeful harm to members of the College. Are we clear?", npc_id: savos_aren.id, town_id: winterhold.id)
kill_winterhold_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Korir's torso with a firebolt spell.", npc_id: winterhold_jarl.id, bounty: 1000, town_id: winterhold.id, action_name: "Attack")
talk_winterhold_jarl = Interaction.find_or_create_by(description: "You know Winterhold used to be the seat of power in Skyrim? Now it's a shell. Few will admit it, but we know the truth about the Great Collapse. The College is the worst thing that's ever happened to Winterhold, maybe to Skyrim.", npc_id: winterhold_jarl.id, town_id: winterhold.id)
kill_ancano = Interaction.find_or_create_by(description: "You cleave Ancano's leg in two with your sword.", npc_id: ancano.id, bounty: 1000, town_id: winterhold.id, action_name: "Attack")
talk_ancano = Interaction.find_or_create_by(description: "I have many important things on my mind. Your concerns are not among them. Are you quite sure we need to be speaking?", npc_id: ancano.id, town_id: winterhold.id)

### Whiterun Interactions ###
kill_heimskr = Interaction.find_or_create_by(description: "You slice Heimskr cleanly through the chest with your blade.", npc_id: heimskr.id, bounty: 1000, town_id: whiterun.id, action_name: "Attack")
talk_heimskr = Interaction.find_or_create_by(description: "You have come! You have come to hear the word of Talos! The truth, child of Talos, is that the Dragon's children have come to purge the world in fire and righteousness! There are those who would silence the Dragon's truth... BUT NOT I! Not Heimskr! His word will be known! He has returned... Oh, how Talos has returned. Helgen has been purged in his light. Will Whiterun be next? The Imperials silence us because they fear us! They are cowards! Cowards and fools who have forgotten the truth! ... May Talos guide you ... ", npc_id: heimskr.id, town_id: whiterun.id, action_name: "Talk")
kill_whiterun_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Balgruuf the Greater's torso with a firebolt spell.", npc_id: whiterun_jarl.id, bounty: 1000, town_id: whiterun.id, action_name: "Attack")
talk_whiterun_jarl = Interaction.find_or_create_by(description: "I'm the Jarl, not a barkeep. Speak your business.", npc_id: whiterun_jarl.id, town_id: whiterun.id)
kill_nazeem = Interaction.find_or_create_by(description: "You cleave Nazeem's leg in two with your sword.", npc_id: nazeem.id, bounty: 1000, town_id: whiterun.id, action_name: "Attack")
talk_nazeem = Interaction.find_or_create_by(description: "Do you get to the Cloud District very often? Oh, what am I saying - of course you don't.", npc_id: nazeem.id, town_id: whiterun.id)

### Quests ###
enemies = ["Bandit Chief", "Giant", "Dragon", "Hagraven", "Draugr", "Dwemer Centurion", "Bear"]
locations = ["Ysgramor's Tomb", "Faldar's Tooth", "Throat of the World", "Irngthamz", "Bleak Falls Barrow", "Frostmere Crypt", "Bronzewater Cave"]
quest1 = Quest.create(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 500, goodwill: 200, town_id: nil)
quest2 = Quest.create(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 1000, goodwill: 200, town_id: nil)
quest3 = Quest.find_or_create_by(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 700, goodwill: 200, town_id: nil)
quest4 = Quest.find_or_create_by(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 200, goodwill: 200, town_id: nil)
quest5 = Quest.find_or_create_by(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 450, goodwill: 200, town_id: nil)
quest6 = Quest.find_or_create_by(description: "The Jarl has set a bounty on the #{enemies.sample} at #{locations.sample}.", reward: 200, goodwill: 200, town_id: nil)

### Falkreath Interactions ###
kill_sinding = Interaction.find_or_create_by(description: "You eviscerate Sinding's neck with one swipe of your sword.", npc_id: sinding.id, goodwill: 100, town_id: falkreath.id, action_name: "Attack")
talk_sinding = Interaction.find_or_create_by(description: "I am one of them. A werewolf. It's my secret, and my shame. I had just come into Falkreath. They needed some help working the mill, and I thought that would be something safe. Something I could do. When I saw the little girl, I was just... I could feel it coming on. I could taste the... I needed to hunt. But this pitiful, limited body wasn't meant for hunting. Slow. No claws. Weak, mashing teeth for chewing cud. I held in my rage as long as I could. But it boiled inside of me. She looked so fragile. Helpless prey. And then... I feel terrible about what happened. About what I did. It would probably be best for everyone if I just went away.", npc_id: sinding.id, bounty: 1000, town_id: falkreath.id, action_name: "Talk")
talk_mathies = Interaction.find_or_create_by(description: "Our daughter died. She was... Sinding ripped her apart. Like a sabre cat tears a deer. We barely found enough of her to bury.", npc_id: mathies.id, town_id: falkreath.id, action_name: "Talk")
kill_mathies = Interaction.find_or_create_by(description: "You slaughter Mathies while his wife watches.", npc_id: mathies.id, bounty: 1000, goodwill: 0, town_id: falkreath.id, action_name: "Attack")
kill_falkreath_jarl = Interaction.find_or_create_by(description: "You destroy Jarl Siddgeir's torso with a firebolt spell.", npc_id: falkreath_jarl.id, bounty: 1000, town_id: falkreath.id, action_name: "Attack")
talk_falkreath_jarl = Interaction.find_or_create_by(description: "I'm the Jarl, not a barkeep. Speak your business.", npc_id: falkreath_jarl.id, town_id: falkreath.id, action_name: "Talk")
1






#

# binding.pry
# 0

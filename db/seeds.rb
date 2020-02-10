Town.destroy_all
Interaction.destroy_all
Player.destroy_all
Npc.destroy_all
Quest.destroy_all
Relationship.destroy_all

riften = Town.new(name: "Riften", jarl: "Jarl Laila Law-Giver")
windhelm = Town.new(name: "Windhelm", jarl: "Jarl Ulfric Stormcloak")
winterhold = Town.new(name: "Winterhold", jarl: "Jarl Korir")
whiterun = Town.new(name: "Whiterun", jarl: "Jarl Balgruuf the Greater")
falkreath = Town.new(name: "Falkreath", jarl: "Jarl Siddgeir")
markarth = Town.new(name: "Markarth", jarl: "Jarl Igmund")
dawnstar = Town.new(name: "Dawnstar", jarl: "Jarl Skald the Elder")
morthal = Town.new(name: "Morthal", jarl: "Jarl Idgrod Ravencrone")
solitude = Town.new(name: "Solitude", jarl: "Jarl Elisif the Fair")

### MARKARTH NPCS ###
vorstag = Npc.new(name: "Vorstag", town_id: markarth.id, description: "Vorstag is sitting by the fire in the Silver-Blood Inn.")
markarth_guard = Npc.new(name: "Markarth Guard", town_id: markarth.id, description: "Markarth Guard is leaning against a market stall.")
markarth_jarl = Npc.new(name: "Jarl Laila Law-Giver", town_id: markarth.id, description: "Jarl Laila Law-Giver is sitting confidently on her throne.")
calcelmo = Npc.new(name: "Calcelmo", town_id: markarth.id, description: "Calcelmo is hunched over an enchanting table reading spell books.")
### DAWNSTAR NPCS ###
capt_wayfinder = Npc.new(name: "Captain Wayfinder", town_id: dawnstar.id, description: "Captain Wayfinder is buying supplies for his next maritime voyage.")
dawnstar_guard = Npc.new(name: "Dawnstar Guard", town_id: dawnstar.id, description: "Dawnstar Guard is patrolling the streets of Dawnstar.")





binding.pry
0
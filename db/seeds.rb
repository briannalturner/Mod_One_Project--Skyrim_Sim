Town.destroy_all
Interaction.destroy_all
Player.destroy_all
Npc.destroy_all
Quest.destroy_all
Relationship.destroy_all

riften = Town.create_or_find_by(name: "Riften", jarl: "Jarl Laila Law-Giver")
windhelm = Town.create_or_find_by(name: "Windhelm", jarl: "Jarl Ulfric Stormcloak")
winterhold = Town.create_or_find_by(name: "Winterhold", jarl: "Jarl Korir")
whiterun = Town.create_or_find_by(name: "Whiterun", jarl: "Jarl Balgruuf the Greater")
falkreath = Town.create_or_find_by(name: "Falkreath", jarl: "Jarl Siddgeir")
markarth = Town.create_or_find_by(name: "Markarth", jarl: "Jarl Igmund")
riften = Town.create_or_find_by(name: "Riften", jarl: "Laila Law-Giver")
riften = Town.create_or_find_by(name: "Riften", jarl: "Laila Law-Giver")


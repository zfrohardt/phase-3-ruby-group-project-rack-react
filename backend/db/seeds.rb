require 'json'

puts "Deleting old stuff..."

Character.destroy_all
Spell.destroy_all
Relationship.destroy_all

puts "Creating new stuff..."

puts "Adding helper functions..."
def spellHelper(level_string)
    if level_string == "cantrip"
        return 0
    else
        return level_string.to_i
    end
end

puts "Adding classes..."
Character.create(name: "Barbarian")
Character.create(name: "Bard")
Character.create(name: "Cleric")
Character.create(name: "Druid")
Character.create(name: "Fighter")
Character.create(name: "Monk")
Character.create(name: "Paladin")
Character.create(name: "Ranger")
Character.create(name: "Rogue")
Character.create(name: "Sorcerer")
Character.create(name: "Warlock")
Character.create(name: "Wizard")

puts "Adding spells..."
file = File.read("../spells.json")
json = JSON.parse(file)
puts json.count
json.each do |spell|
    spell_entry = Spell.create(
        name: spell["name"],
        level: spellHelper(spell["level"]),
        description: spell["description"],
        school: spell["school"],
        components: spell["components"]["raw"],
        user_created: false
    )

    spell["classes"].each do |char|
        char_entry = Character.find_by(name: char.capitalize)
        Relationship.create(spell_id: spell_entry.id, character_id: char_entry.id)
    end
end

puts "Seeding done!"
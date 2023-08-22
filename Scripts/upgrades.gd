extends Node

# Currently Available Upgrades
var upgrades_list: Array = [
	{
		"name": "Staff Level 2",
		"affects": "staff",
		"level": 2,
		"description": "Attack Distance + 50%\nAttack Speed + 10%\nDamage + 50%\nProjectile Size + 50%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.5
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.1
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.5
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.5
			}
		]
	},
	{
		"name": "Magnet Level 2",
		"affects": "magnet",
		"level": 2,
		"description": "Pickup Range + 100%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 2.0
			}
		]
	},
	{
		"name": "Exploding Enemies Level 1",
		"level": 1,
		"affects": "exploding_enemies",
		"description": "Enemies have a 2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1
			}
		]
	},
	{
		"name": "Movement Speed +10%",
		"level": 1,
		"affects": "stats",
		"description": "Increases Movement Speed +10%",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "movement_speed_increase",
				"multiplier": 1.1
			}
		]
	},
	{
		"name": "Max Health +10%",
		"level": 1,
		"affects": "stats",
		"description": "Increases max health +10% and adds the difference to current health.",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "max_health_increase",
				"multiplier": 1.1
			}
		]
	},
	{
		"name": "Health Regenerate +1",
		"level": 1,
		"affects": "stats",
		"description": "Regenerate +1 health every 3 seconds",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "health_regen_increase",
				"multiplier": 1
			}
		]
	},
	{
		"name": "Orbital Level 1",
		"level": 1,
		"affects": "orbital",
		"description": "An Orb that rotates around the player, doing damage to nearby enemies.",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_increase",
				"multiplier": 1
			}
		]
	}
]

# Staff Upgrades
var staff_upgrades_list: Array = [
	{
		"name": "Staff Level 3",
		"level": 3,
		"affects": "staff",
		"description": "Attack Distance + 50%\nAttack Speed + 10%\nDamage + 50%\nProjectile Size + 50%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.50
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.10
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.50
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.50
			}
		]
	},
	{
		"name": "Staff Level 4",
		"level": 4,
		"affects": "staff",
		"description": "Attack Distance + 25%\nAttack Speed + 10%\nDamage + 25%\nProjectile Size + 25%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.25
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.10
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.25
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.25
			}
		]
	},
	{
		"name": "Staff Level 5",
		"level": 5,
		"affects": "staff",
		"description": "Attack Distance + 25%\nAttack Speed + 10%\nDamage + 25%\nProjectile Size + 25%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.25
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.10
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.25
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.25
			}
		]
	},
	{
		"name": "Staff Level 6",
		"level": 6,
		"affects": "staff",
		"description": "Attack Distance + 20%\nAttack Speed + 10%\nDamage + 20%\nProjectile Size + 20%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.10
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.20
			}
		]
	},
	{
		"name": "Staff Level 7",
		"level": 7,
		"affects": "staff",
		"description": "Attack Distance + 20%\nAttack Speed + 10%\nDamage + 20%\nProjectile Size + 20%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.10
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.20
			}
		]
	},
	{
		"name": "Staff Level 8",
		"level": 8,
		"affects": "staff",
		"description": "Attack Distance + 20%\nAttack Speed + 20%\nDamage + 20%\nProjectile Size + 20%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.20
			}
		]
	},
	{
		"name": "Staff Level 9",
		"level": 9,
		"affects": "staff",
		"description": "Attack Distance + 50%\nAttack Speed + 50%\nDamage + 20%\nProjectile Size + 20%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 1.50
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 1.50
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 1.20
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 1.20
			}
		]
	},
	{
		"name": "Staff Level 10",
		"level": 10,
		"affects": "staff",
		"description": "Attack Distance + 100%\nAttack Speed + 100%\nDamage + 100%\nProjectile Size + 100%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "attack_distance_increase",
				"multiplier": 2
			},
			{
				"func_name": "attack_speed_increase",
				"multiplier": 2
			},
			{
				"func_name": "weapon_damage_increase",
				"multiplier": 2
			},
			{
				"func_name": "projectile_size_increase",
				"multiplier": 2
			}
		]
	}
]

# Maget Upgrades
var magenet_upgrades_list: Array = [
	{
		"name": "Magnet Level 3",
		"level": 3,
		"affects": "magnet",
		"description": "Pickup Range + 50%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.5
			}
		]
	},
	{
		"name": "Magnet Level 4",
		"level": 4,
		"affects": "magnet",
		"description": "Pickup Range + 25%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.25
			}
		]
	},
	{
		"name": "Magnet Level 5",
		"level": 5,
		"affects": "magnet",
		"description": "Pickup Range + 20%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.20
			}
		]
	},
	{
		"name": "Magnet Level 6",
		"level": 6,
		"affects": "magnet",
		"description": "Pickup Range + 15%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.15
			}
		]
	},
		{
		"name": "Magnet Level 7",
		"level": 7,
		"affects": "magnet",
		"description": "Pickup Range + 10%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.10
			}
		]
	},
	{
		"name": "Magnet Level 8",
		"level": 8,
		"affects": "magnet",
		"description": "Pickup Range + 25%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.25
			}
		]
	},
	{
		"name": "Magnet Level 9",
		"level": 9,
		"affects": "magnet",
		"description": "Pickup Range + 10%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.10
			}
		]
	},
	{
		"name": "Magnet Level 10",
		"level": 10,
		"affects": "magnet",
		"description": "Pickup Range + 50%",
		"type": "stat",
		"upgrade_functions": [
			{
				"func_name": "pickup_range_increase",
				"multiplier": 1.50
			}
		]
	}
]

# Exploding Enemies Upgrades
var exploding_enemies_upgrades: Array = [
	{
		"name": "Exploding Enemies Level 2",
		"level": 2,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
	{
		"name": "Exploding Enemies Level 3",
		"level": 3,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
	{
		"name": "Exploding Enemies Level 4",
		"level": 4,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
	{
		"name": "Exploding Enemies Level 5",
		"level": 5,
		"affects": "exploding_enemies",
		"description": "Enemies have +5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.05
			}
		]
	},
		{
		"name": "Exploding Enemies Level 6",
		"level": 6,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
		{
		"name": "Exploding Enemies Level 7",
		"level": 7,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
		{
		"name": "Exploding Enemies Level 8",
		"level": 8,
		"affects": "exploding_enemies",
		"description": "Enemies have +5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.05
			}
		]
	},
	{
		"name": "Exploding Enemies Level 9",
		"level": 8,
		"affects": "exploding_enemies",
		"description": "Enemies have +2.5% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.025
			}
		]
	},
	{
		"name": "Exploding Enemies Level 10",
		"level": 8,
		"affects": "exploding_enemies",
		"description": "Enemies have +10% chance to explode in death, damaging nearby enemies",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "exploding_enemies",
				"multiplier": 1.1
			}
		]
	}
]

# Orbital Upgrades
var orbital_upgrades: Array = [
	{
		"name": "Orbital Level 2",
		"level": 2,
		"affects": "orbital",
		"description": "2 Orbs that rotates around the player, doing damage to nearby enemies.",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_increase",
				"multiplier": 1
			}
		]
	},
	{
		"name": "Orbital Level 3",
		"level": 3,
		"affects": "orbital",
		"description": "3 Orbs that rotates around the player, doing damage to nearby enemies.",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_increase",
				"multiplier": 1
			}
		]
	},
	{
		"name": "Orbital Level 4",
		"level": 4,
		"affects": "orbital",
		"description": "4 Orbs that rotates around the player, doing damage to nearby enemies.",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_increase",
				"multiplier": 1
			}
		]
	},
	{
		"name": "Orbital Level 5",
		"level": 5,
		"affects": "orbital",
		"description": "Increase the size of the orbs by 10%",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_size_increase",
				"multiplier": 1.1
			}
		]
	},
	{
		"name": "Orbital Level 6",
		"level": 6,
		"affects": "orbital",
		"description": "Increase the size of the orbs by 5%",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_size_increase",
				"multiplier": 1.05
			}
		]
	},
	{
		"name": "Orbital Level 7",
		"level": 7,
		"affects": "orbital",
		"description": "Increase the size of the orbs by 5%",
		"type": "ability",
		"upgrade_functions": [
			{
				"func_name": "orbital_size_increase",
				"multiplier": 1.05
			}
		]
	}
]

func remove_upgrade(upgrade):
	for u in upgrades_list:
		if u == upgrade:
			upgrades_list.erase(upgrade)

func add_next_level_to_available(upgrade):
	if upgrade.affects == "stats": return
	
	if upgrade.affects == "staff":
		if staff_upgrades_list.size() > 0:
			upgrades_list.append(staff_upgrades_list[0])
			staff_upgrades_list.erase(staff_upgrades_list[0])
	elif upgrade.affects == "magnet":
		if magenet_upgrades_list.size() > 0:
			upgrades_list.append(magenet_upgrades_list[0])
			magenet_upgrades_list.erase(magenet_upgrades_list[0])
	elif upgrade.affects == "exploding_enemies":
		if exploding_enemies_upgrades.size() > 0:
			upgrades_list.append(exploding_enemies_upgrades[0])
			exploding_enemies_upgrades.erase(exploding_enemies_upgrades[0])
	elif upgrade.affects == "orbital":
		if orbital_upgrades.size() > 0:
			upgrades_list.append(orbital_upgrades[0])
			orbital_upgrades.erase(orbital_upgrades[0])
	
	remove_upgrade(upgrade)

func exploding_enemies(multiplier):
	for a in Global.player_stats.abilities:
		if a.name == "exploding_enemies":
			if a.enabled == false:
				a.enabled = true
			else:
				a.chance *= multiplier
				a.level = a.level + 1

func max_health_increase(percent):
	Global.player_stats.max_health *= percent

func health_regen_increase(hp):
	Global.player_stats.health_regen += hp

func pickup_range_increase(percent):
	Global.player_stats.pickup_range_radius *= percent

func attack_distance_increase(percent):
	Global.weapon.projectile_distance *= percent

func attack_speed_increase(percent):
	Global.weapon.time_between_shots /= percent

func movement_speed_increase(percent):
	Global.player_stats.movement_speed *= percent

func projectile_size_increase(percent):
	Global.weapon.projectile_size_multiplier *= percent

func weapon_damage_increase(percent):
	Global.weapon.damage *= percent

func orbital_increase(amount):
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			if !a.enabled:
				a.enabled = true
			a.count += amount

func orbital_size_increase(amount):
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			a.size *= amount


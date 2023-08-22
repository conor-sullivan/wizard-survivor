extends State
class_name Dead

@export var enemy : CharacterBody2D
@export var fireball_sound : AudioStreamPlayer2D
var fireball_explosion_chance : float = 0

func Enter():
	Global.increase_enemies_killed()
	send_fireballs_on_death()
	die()

func Update(delta: float):
	pass

func Physics_Update(delta: float):
	pass


func die():
	Global.camera.shake(0.1,3)
	Global.instance_node(Global.xp, enemy.global_position)
	Global.enemy_count -= 1
	enemy.queue_free()

func send_fireballs_on_death():
	var rand = randi_range(1, 100)
	for a in Global.player_stats.abilities:
		if a.name == "exploding_enemies":
			if !a.enabled: return
			fireball_explosion_chance = a.chance
	if rand <= fireball_explosion_chance:
		instance_fireball_circle()
		fireball_sound.play()
		await fireball_sound.finished

func instance_fireball_circle():
	Global.instance_node(Global.fireball_circle, enemy.global_position)

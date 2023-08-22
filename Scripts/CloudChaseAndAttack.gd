extends ChaseAndAttack

var is_dead : bool = false

func Enter():
	max_health = 1000
	movement_speed = 300
	player = Global.player
	current_health = max_health
	Global.take_damage.connect(take_damage)
	Global.enemy_count +=1

func Exit():
	Global.cloud_alive = false

func handle_movement(delta):
	if enemy.global_position.distance_to(player.global_position) <= 200: return
	var direction_to_player = (player.global_position - enemy.global_position).normalized()
	enemy.velocity.x = move_toward(enemy.velocity.x, direction_to_player.x * movement_speed, delta * movement_speed)
	enemy.velocity.y = move_toward(enemy.velocity.y, direction_to_player.y * movement_speed, delta * movement_speed)

func take_damage(body, hp):
	super.take_damage(body, hp)
	Global.camera.shake(.5, 8)

	if current_health <= 0:
		is_dead = true
		Transitioned.emit(self, "Dead")
	
func attack():
	if is_dead: return
	var number_of_attacks = 50
	
	if enemy.attack_timer.is_stopped():
		enemy.attack_timer.start()
		for a in number_of_attacks:
			var f = Global.instance_node(Global.cloud_projectile, enemy.global_position)
			var start = f.position
			var move_to = player.global_position - start
			f.set_move_direction(move_to)
			await get_tree().create_timer(.1).timeout
	

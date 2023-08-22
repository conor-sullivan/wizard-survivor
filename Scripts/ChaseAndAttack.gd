extends State
class_name ChaseAndAttack

var player : CharacterBody2D
var current_health = 0

@export var enemy : CharacterBody2D
@export var effects : AnimationPlayer
@export var attack_damage = 5
@export var max_health = 100
@export var movement_speed = 100
@export var ground_acceleration = 800.0
@export var knockback_speed = 125.0
@export var attack_velocity = 500.0


func Enter():
	player = Global.player
	current_health = max_health
	Global.take_damage.connect(take_damage)
	Global.enemy_count +=1
	
func Update(delta: float):
	handle_attack()

func Physics_Update(delta: float):
	handle_movement(delta)

func Exit():
	pass


func handle_movement(delta):
	var direction_to_player = (player.global_position - enemy.global_position).normalized()
	enemy.velocity.x = move_toward(enemy.velocity.x, direction_to_player.x * movement_speed, delta * movement_speed)
	enemy.velocity.y = move_toward(enemy.velocity.y, direction_to_player.y * movement_speed, delta * movement_speed)

func handle_attack():
	if not enemy.is_attacking:
		return
	attack()
	await enemy.attack_timer.timeout
	
func attack():
	if enemy.attack_timer.is_stopped():
		Global.take_damage.emit(player, attack_damage)
		enemy.attack_timer.start()

func take_damage(body, hp):
	if body != enemy: return
	apply_knockback()
	current_health -= hp
	var new_hp_change_notification = Global.instance_node(Global.hp_change_notification, enemy.global_position)
	new_hp_change_notification.set_label(hp, Global.take_damage_notification_color)
	effects.play("hit")
	await effects.animation_finished
	effects.play("RESET")
	if current_health <= 0:
		Transitioned.emit(self, "Dead")

func apply_knockback():
	var direction_to_player = (player.global_position - enemy.global_position).normalized()
	enemy.velocity += -direction_to_player * knockback_speed

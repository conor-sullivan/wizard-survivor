extends Node2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var shoot_speed_timer: Timer = $ShootSpeedTimer
@onready var sound: AudioStreamPlayer2D = $sound

var projectile = preload("res://Scenes/staff_projectile.tscn")

@export var shot_area_width = 10
var shooting = false
var targets: Array

func _ready() -> void:
	shoot_speed_timer.wait_time = Global.weapon.time_between_shots
	Global.new_stats.connect(update_stats)
	update_stats()

func _process(delta: float) -> void:
	if shooting and shoot_speed_timer.is_stopped():
		handle_shoot()
		shoot_speed_timer.start()
		
func update_stats():
	var distance = Global.weapon.projectile_distance 
	shoot_speed_timer.wait_time = Global.weapon.time_between_shots
	collision_shape_2d.shape.radius = distance

func handle_shoot():
	var p = Global.instance_node(projectile, global_position)
	var look_direction = targets[-1].global_position - p.global_position
	p.global_rotation = atan2(look_direction.y, look_direction.x)
	p.scale *= Global.weapon.projectile_size_multiplier
	sound.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("zombies"):
		targets.append(body)
		shooting = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	targets.erase(body)
	if targets.size() <=0:
		shooting = false

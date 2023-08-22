extends CharacterBody2D

@onready var player: CharacterBody2D = Global.player
@onready var animations: AnimatedSprite2D = $animations
@onready var attack_timer: Timer = $AttackTimer
@onready var effects: AnimationPlayer = $Effects
@onready var spawn_babies_sound: AudioStreamPlayer2D = $SpawnBabiesSound
@onready var fireball_sound: AudioStreamPlayer2D = $FireballSound

var is_parent = true

@export var take_damage_notification_color = Vector3(1,1,1)
@export var attack_damage = 1
@export var max_health = 300
@export var movement_speed = 150
@export var ground_acceleration = 800.0
@export var knockback_speed = 1000.0
@export var attack_velocity = 500.0
@export var fireball_explosion_chance = 10

var current_health 
var target = null
var is_attacking = false
var is_dead = false

func _physics_process(delta: float) -> void:
	if not player:
		return
	handle_animations()
	move_and_slide()
	

func handle_animations():
	if velocity.x <= -1:
		animations.flip_h = true
	else:
		animations.flip_h = false


func _on_attack_radius_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target = body
		is_attacking = true


func _on_attack_radius_body_exited(body: Node2D) -> void:
	is_attacking = false

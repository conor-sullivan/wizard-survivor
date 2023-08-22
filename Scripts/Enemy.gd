extends CharacterBody2D
class_name Enemy

@onready var animations: AnimatedSprite2D = $animations
@onready var attack_timer: Timer = $AttackTimer

var is_attacking = false

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_attack_radius_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		is_attacking = true

func _on_attack_radius_body_exited(body: Node2D) -> void:
	is_attacking = false

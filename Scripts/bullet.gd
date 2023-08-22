extends CharacterBody2D

var speed = 1000

func _physics_process(delta: float) -> void:
	move_and_collide(velocity.normalized() * speed * delta)

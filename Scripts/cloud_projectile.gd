extends Area2D
class_name cloud_projectile

@onready var destroy_timer: Timer = $DestroyTimer

const FIREBALL_SPEED = 1

var is_moving = false
var move_direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_moving:
		move(delta)
	if not Global.cloud_alive:
		queue_free()

func move(delta):
	global_position = global_position + move_direction * delta

func set_move_direction(direction):
	move_direction = direction * FIREBALL_SPEED
	is_moving = true


func _on_body_entered(body: Node2D) -> void:
	if body == Global.player:
		Global.take_damage.emit(body, 1)


func _on_destroy_timer_timeout() -> void:
	queue_free()

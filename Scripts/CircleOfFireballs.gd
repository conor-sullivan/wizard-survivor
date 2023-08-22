extends Node2D

@onready var fireball: Area2D = $Fireball
@onready var fireball_2: Area2D = $Fireball2
@onready var fireball_3: Area2D = $Fireball3
@onready var fireball_4: Area2D = $Fireball4
@onready var fireball_5: Area2D = $Fireball5
@onready var fireball_6: Area2D = $Fireball6
@onready var fireball_7: Area2D = $Fireball7
@onready var fireball_8: Area2D = $Fireball8
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var fireballs_moved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not fireballs_moved:
		animation_player.play("fade_out")
		move_fireball(fireball)
		move_fireball(fireball_2)
		move_fireball(fireball_3)
		move_fireball(fireball_4)
		move_fireball(fireball_5)
		move_fireball(fireball_6)
		move_fireball(fireball_7)
		move_fireball(fireball_8)
		fireballs_moved = true
	
func move_fireball(f):
	var center = Vector2.ZERO
	var move_to = center + f.position
	f.set_move_direction(move_to)


func _on_kill_timer_timeout() -> void:
	queue_free()

extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sound: AudioStreamPlayer2D = $Sound

var hasBeenPickedUp = false
var movement_speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_2d.shape.radius = Global.player_stats.pickup_range_radius

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hasBeenPickedUp:
		move_towards_player(delta)


func move_towards_player(delta):
	var direction_to_player = (Global.player.global_position - global_position).normalized()
	position = position + direction_to_player * movement_speed * delta
	if global_position.distance_to(Global.player.global_position) <= 3:
		Global.add_player_experiance()
		queue_free()
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not hasBeenPickedUp:
		hasBeenPickedUp = true


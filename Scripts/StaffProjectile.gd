extends Area2D

var targets: Array
var is_moving = false
var move_direction
var distance_traveled = Vector2.ZERO
var start_position
var damaged_enemies: Array
var damage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damage = Global.weapon.damage
	start_position = global_position
	handle_rotation()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_movement(delta)
	handle_max_distance()

func handle_max_distance():
	if distance_traveled >= Global.weapon.projectile_distance:
		queue_free()

func handle_rotation():
#	var look_direction = get_global_mouse_position() - global_position
#	global_rotation = atan2(look_direction.y, look_direction.x)
	pass
	
func handle_movement(delta):
	var motion = Vector2(cos(self.rotation), sin(self.rotation)) * Global.weapon.projectile_speed
	position += motion * delta
	distance_traveled = start_position.distance_to(global_position)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("zombies") and not body.get_instance_id() in damaged_enemies:
		damaged_enemies.append(body.get_instance_id())
		
		Global.take_damage.emit(body, damage)

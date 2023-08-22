extends Dead
@onready var path_follow_2d: PathFollow2D = $"../../Path2D/PathFollow2D"
@onready var marker_2d: Marker2D = $"../../Path2D/PathFollow2D/Marker2D"

func Enter():
	send_fireballs_on_death()
	spawn_babies()
	die()

func spawn_babies():
	if not enemy.is_parent: return
	for c in randi_range(3,8):
		var location = randf_range(0, 1)
		path_follow_2d.progress_ratio = location
		
		var instance = Global.instance_node(Global.slime, marker_2d.global_position)
		instance.scale = Vector2(0.5, 0.5)
		instance.is_parent = false
		instance.max_health = 1
	enemy.spawn_babies_sound.play()
	await enemy.spawn_babies_sound.finished

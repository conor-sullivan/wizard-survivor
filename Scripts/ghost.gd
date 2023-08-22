extends Enemy

func _process(delta: float) -> void:
	handle_animations()

func handle_animations():
	if velocity.x >= -1:
		animations.flip_h = true
	else:
		animations.flip_h = false

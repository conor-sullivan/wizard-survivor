extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var hasPlayed = false
	
func _process(delta: float) -> void:
	if not hasPlayed:
		animation_player.play("fade and fly away")
		await animation_player.animation_finished
		hasPlayed = true
		queue_free()
		

func set_label(text, color):
	$Label.add_theme_color_override("font_color", Color(color[0], color[1], color[2]))
	$Label.text = str(round(text))

func _on_kill_timer_timeout() -> void:
	pass

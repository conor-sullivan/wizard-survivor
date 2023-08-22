extends Sprite2D

var damage : float = 0
var current_size_multiplier : float 

func _ready() -> void:
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			damage = a.damage
			current_size_multiplier = a.size
			
	scale *= current_size_multiplier

func _process(delta: float) -> void:
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			if a.size != current_size_multiplier:
				current_size_multiplier = a.size
				scale *= current_size_multiplier
		await get_tree().create_timer(0.2).timeout

func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.take_damage.emit(body, damage)

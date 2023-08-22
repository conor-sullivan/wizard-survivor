extends Dead
@onready var cpu_particles_2d: CPUParticles2D = $"../../CPUParticles2D"
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"
@onready var drop_shadow: Sprite2D = $"../../DropShadow"



func die():
	Global.camera.shake(1,10)
	Global.instance_node(Global.xp, enemy.global_position)
	Global.enemy_count -= 1
	fireball_sound.play()
	sprite_2d.hide()
	drop_shadow.hide()
	cpu_particles_2d.emitting = true
	await get_tree().create_timer(2).timeout
	enemy.queue_free()

extends Node2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

@export var damage : float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cpu_particles_2d.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("zombies"):
		Global.take_damage.emit(body, damage)


func _on_kill_timer_timeout() -> void:
	queue_free()

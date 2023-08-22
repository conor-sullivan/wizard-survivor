extends Camera2D

var shake_amount = 0
var default_offset = offset
var pos_x
var pos_y

@onready var camera_shake_timer: Timer = $CameraShakeTimer

func _ready() -> void:
	set_process(false)
	Global.camera = self
	randomize()

func _process(delta: float) -> void:
	offset = Vector2(randf_range(-1,1) * shake_amount, randf_range(-1,1) * shake_amount)

func shake(time, amount):
	camera_shake_timer.wait_time = time
	shake_amount = amount
	set_process(true)
	camera_shake_timer.start()

func _on_camera_shake_timer_timeout() -> void:
	set_process(false)

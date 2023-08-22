extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var health_bar: ProgressBar = $HealthBar
@onready var xp_bar: ProgressBar = $HUD/ExperianceBar/ProgressBar
@onready var progress_bar_update_timer: Timer = $ProgressBarUpdateTimer
@onready var current_level: Label = $HUD/ExperianceBar/CurrentLevel
@onready var next_level: Label =  $HUD/ExperianceBar/NextLevel
@onready var effects: AnimationPlayer = $Effects
@onready var xp_sound: AudioStreamPlayer2D = $XpSound
@onready var level_up_sound: AudioStreamPlayer2D = $LevelUpSound
@onready var take_damage_sound: AudioStreamPlayer2D = $TakeDamageSound
@onready var orbital_spinner: Node2D = $OrbitalSpinner
@onready var number_enemies_killed_label_2: Label = $HUD/ExperianceBar/NumberEnemiesKilledLabel2


@onready var shoot_timer: Timer = $ShootTimer
@onready var camera: Camera2D = $Camera2D
@onready var staff: Node2D = $Staff

@export var game_over : PackedScene
var hp_change_notification = preload("res://Scenes/hp_change_notification.tscn")
var bullet_scene = preload("res://Scenes/bullet.tscn")

var current_health
var old_max_health

@export var ground_acceleration = 800.0
@export var friction = 750.0
@export var take_damage_notification_color = Vector3(1,1,1)
@export var gain_health_notification_color = Vector3(0,1,0)

var initial_rotation : Vector2

func _ready() -> void:	
	Global.player = self
	Global.take_damage.connect(take_damage)
	shoot_timer.wait_time = Global.weapon.time_between_shots
	current_health = Global.player_stats.max_health
	health_bar.max_value = Global.player_stats.max_health
	old_max_health = Global.player_stats.max_health

func _process(delta: float) -> void:
	health_bar.value = current_health
	xp_bar.value = Global.experiance
	add_new_max_health_difference()
	update_shoot_timer()
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			if a.enabled:
				orbital_spinner.show()

func _physics_process(delta: float) -> void:
	var input_direction_x = Input.get_axis("left", "right")
	var input_direction_y = Input.get_axis("up", "down")
	update_enemies_killed()
	handle_rotation()
	handle_acceleration(input_direction_x, input_direction_y, delta)
	apply_friction(input_direction_x, input_direction_y, delta)
	handle_animations()
	move_and_slide()

func handle_acceleration(input_direction_x, input_direction_y, delta):
	if input_direction_x: 
		velocity.x = move_toward(velocity.x, input_direction_x * Global.player_stats.movement_speed, ground_acceleration * delta)
		
	if input_direction_y:
		velocity.y = move_toward(velocity.y, input_direction_y * Global.player_stats.movement_speed, ground_acceleration * delta)	

func apply_friction(input_direction_x, input_direction_y, delta):
	if not input_direction_x:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	if not input_direction_y:
		velocity.y = move_toward(velocity.y, 0, friction * delta)

func handle_rotation():
	var look_direction = get_global_mouse_position() - global_position
	staff.global_rotation = atan2(look_direction.y, look_direction.x)
		
func die():
	get_tree().change_scene_to_packed(game_over)
	queue_free()

func update_shoot_timer():
	if Global.weapon.time_between_shots != shoot_timer.wait_time:
		shoot_timer.wait_time = Global.weapon.time_between_shots	

func take_damage(body, hp):
	if body != self: return
	effects.play("hit")
	play_take_damage_sound()
	Global.camera.shake(0.1,5)
	await effects.animation_finished
	effects.play("RESET")
	current_health -= hp
	var new_hp_change_notification = Global.instance_node(hp_change_notification, global_position)
	new_hp_change_notification.set_label(hp, take_damage_notification_color)
	
	if current_health <= 0:
		die()

func handle_animations():
	if velocity.x <= -1:
		animations.flip_h = true
	elif velocity.x >= 1:
		animations.flip_h = false
	if Input.is_action_pressed("down") or Input.is_action_pressed("up") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		animations.play("walk")
	else:
		animations.play("idle")

func update_progress_bars():
	health_bar.max_value = Global.player_stats.max_health
	health_bar.value = current_health
	
	xp_bar.min_value = Global.previous_level_experiance
	xp_bar.max_value = Global.level_experiance
	xp_bar.value = Global.experiance
	current_level.text = str(Global.player_level)
	next_level.text = str(Global.player_level + 1)

func add_new_max_health_difference():
	if old_max_health != Global.player_stats.max_health:
		var difference = Global.player_stats.max_health - old_max_health
		old_max_health = Global.player_stats.max_health
		
		current_health += difference
		var new_hp_change_notification = Global.instance_node(hp_change_notification, global_position)
		new_hp_change_notification.set_label(difference, gain_health_notification_color)

func health_regen():
	var hp = Global.player_stats.health_regen
	if hp > 0:
		var new_hp_change_notification = Global.instance_node(hp_change_notification, global_position)
		new_hp_change_notification.set_label(hp, gain_health_notification_color)
		if current_health < Global.player_stats.max_health:
			current_health += Global.player_stats.health_regen

func play_take_damage_sound():
	take_damage_sound.play()

func play_levelUp_sound():
	level_up_sound.play()
	await level_up_sound.finished

func play_xp_pickup_sound(pitch):
	xp_sound.pitch_scale = pitch
	xp_sound.play()
	await xp_sound.finished

func update_enemies_killed():
	if number_enemies_killed_label_2.text != str(Global.player_stats.enemies_killed):
		number_enemies_killed_label_2.text = str(Global.player_stats.enemies_killed)

func _on_progress_bar_update_timer_timeout() -> void:
	update_progress_bars()


func _on_health_regen_timer_timeout() -> void:
	health_regen()

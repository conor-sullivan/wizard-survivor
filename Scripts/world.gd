extends Node2D

var slime = preload("res://Scenes/slime.tscn")
var ghost = preload("res://Scenes/ghost.tscn")
var cloud = preload("res://Scenes/cloud.tscn")

@onready var wave_timer: Timer = $WaveTimer

var enemies_alive = false
var wave_timer_running = false
var current_wave = 1
var is_paused = false

var slime_waves = [5,8,15,20,30,35,40,45,50,55,60,65,70]
var cloud_waves = [10,18,25,32,41,49,55,62,70,75]

func _ready() -> void:
	Global.world = self
	Global.new_stats.connect(start_new_wave)
	Global.pause.connect(pause)
	randomize()
	spawn_ghosts(5)
	wave_timer.start()
	wave_timer_running = true


func _process(delta: float) -> void:
	current_wave = Global.player_level
	spawn_enemies_for_level()

func spawn_ghosts(count):
	for c in count:
		if get_tree().paused == false:
			var location = randf_range(0, 1)
			$Path2D/PathFollow2D.progress_ratio = location
			var instance = ghost.instantiate()
			instance.global_position = $Path2D/PathFollow2D/Marker2D.global_position
			add_child(instance)

func _on_wave_timer_timeout() -> void:
		return

#	spawn_ghosts(current_wave * 5)

func spawn_slimes(count):
	for c in count:
		var location = randf_range(0, 1)
		$Path2D/PathFollow2D.progress_ratio = location
		
		var instance = slime.instantiate()
		
		instance.global_position = $Path2D/PathFollow2D/Marker2D.global_position
		add_child(instance)

func spawn_cloud():
	if Global.cloud_spawned_this_round: return
	var location = randf_range(0, 1)
	$Path2D/PathFollow2D.progress_ratio = location
		
	var instance = cloud.instantiate()
	
	instance.global_position = $Path2D/PathFollow2D/Marker2D.global_position
	add_child(instance)
	Global.cloud_spawned_this_round = true
	Global.cloud_alive = true

func spawn_enemies_for_level():
		if Global.enemy_count < Global.player_level * 2:
			var difference =  Global.player_level * 2 - Global.enemy_count
			if current_wave in cloud_waves and !Global.cloud_alive and !Global.cloud_spawned_this_round:
				spawn_cloud()
				return
			if current_wave in slime_waves:
				spawn_slimes(difference)
				if Global.player_level > 10:
					spawn_ghosts(Global.player_level)
			else:
				spawn_ghosts(difference)


func start_new_wave():
	wave_timer.timeout.emit()

func pause():
	if is_paused:
		get_tree().paused = false
	else:
		get_tree().paused = true



func _on_play_time_timer_timeout() -> void:
	Global.increase_seconds_played()

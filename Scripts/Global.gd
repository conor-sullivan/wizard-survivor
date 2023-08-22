extends Node

signal shake_camera
signal upgrade_screen
signal new_stats
signal pause
signal take_damage


var blood_particles = preload("res://Scenes/blood_particles.tscn")
var hp_change_notification = preload("res://Scenes/hp_change_notification.tscn")
var fireball_circle = preload("res://Scenes/circle_of_fireballs.tscn")
var cloud_projectile = preload("res://Scenes/cloud_projectile.tscn")
var xp = preload("res://Scenes/xp_pickup.tscn")
var slime = preload("res://Scenes/slime.tscn")
var level_up_explosion = preload("res://Scenes/level_up_explosion.tscn")

@export var take_damage_notification_color = Vector3(1,1,1)

var camera = Camera2D
var world : Node2D

var weapon = {
	"name": "staff",
	"damage": 100,
	"time_between_shots": 2,
	"projectile_speed": 250,
	"projectile_distance": 100,
	"projectile_size_multiplier": 1
}

var player
var player_stats = {
	"movement_speed" = 125,
	"max_health" = 100,
	"health_regen" = 0,
	"pickup_range_radius" = 20,
	"enemies_killed" = 0,
	"seconds_played" = 0,
	"abilities" = [
		{
			"name" = "exploding_enemies",
			"level" = 1,
			"enabled" = false,
			"chance" = 2.5
		},
		{
			"name" = "orbital",
			"level" = 1,
			"enabled" = false,
			"damage" = 100,
			"count" = 0,
			"size" = 1
		}
	]
}

var player_level = 1
var level_experiance = 1
var previous_level_experiance = 0
var experiance = 0
var enemy_count = 0
var zombie
var fire_distance
var cloud_alive = false
var cloud_spawned_this_round = false

func instance_node(scene, position):
	var new_scene = scene.instantiate()
	new_scene.global_position = position
	call_deferred("add_child", new_scene)
	return new_scene

func add_player_experiance():
	var pitch = experiance / level_experiance * 3.5
	if pitch == 0: pitch = 3.5
	player.play_xp_pickup_sound(pitch)
	experiance = experiance + 1
	if experiance >= level_experiance:
		level_up()

func increase_enemies_killed():
	player_stats.enemies_killed += 1

func increase_seconds_played():
	player_stats.seconds_player += 1

func level_up():
	player.play_levelUp_sound()
	var xp = instance_node(level_up_explosion, player.global_position)
	player.update_progress_bars()
	player_level = player_level + 1
	previous_level_experiance = level_experiance
	level_experiance = level_experiance + player_level * 5

	upgrade_screen.emit()
	pause.emit()
	
	cloud_spawned_this_round = false

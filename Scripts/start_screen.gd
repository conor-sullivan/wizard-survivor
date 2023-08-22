extends Node2D

#@export var level = preload("res://Scenes/world.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()

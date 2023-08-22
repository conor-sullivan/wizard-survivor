extends CanvasLayer
@onready var level_label: Label = $VBoxContainer/LevelLabel
@onready var enemies_label: Label = $VBoxContainer/EnemiesLabel
@onready var time_label: Label = $VBoxContainer/TimeLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = "LEVEL " + str(Global.player_level)
	enemies_label.text = "ENEMIES KILLED " + str(Global.player_stats.enemies_killed)
	time_label.text = "SURVIVED FOR " + str(Global.player_stats.seconds_played / 60) + " MINUTES"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_quit_button_pressed() -> void:
	get_tree().quit()

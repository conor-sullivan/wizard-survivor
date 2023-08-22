extends Node2D
@onready var marker_2d_2: Marker2D = $Marker2D2
@onready var marker_2d_3: Marker2D = $Marker2D3
@onready var marker_2d_4: Marker2D = $Marker2D4

var orb = preload("res://Scenes/orbital.tscn")
var count : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for a in Global.player_stats.abilities:
		if a.name == "orbital":
			count = a.count
	
	if count >= 2:
		if marker_2d_2.get_child_count() == 0:
			marker_2d_2.add_child(orb.instantiate())
	if count >= 3:
		if marker_2d_3.get_child_count() == 0:
			marker_2d_3.add_child(orb.instantiate())
	if count >= 4:
		if marker_2d_4.get_child_count() == 0:
			marker_2d_4.add_child(orb.instantiate())

func _physics_process(delta: float) -> void:
	rotation += 0.02
	await get_tree().create_timer(0.25).timeout

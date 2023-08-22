extends CanvasLayer

@onready var upgrade_one: VBoxContainer = $ColorRect/HBoxContainer/UpgradeOne
@onready var upgrade_two: VBoxContainer = $ColorRect/HBoxContainer/UpgradeTwo
@onready var upgrade_three: VBoxContainer = $ColorRect/HBoxContainer/UpgradeThree

var provided_upgrades: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.upgrade_screen.connect(get_three_upgrades)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_ui_elements():
	$ColorRect/HBoxContainer/UpgradeOne/Label.text = provided_upgrades[0].name
	$ColorRect/HBoxContainer/UpgradeTwo/Label.text = provided_upgrades[1].name
	$ColorRect/HBoxContainer/UpgradeThree/Label.text = provided_upgrades[2].name
	
	$ColorRect/HBoxContainer/UpgradeOne/Description.text = provided_upgrades[0].description
	$ColorRect/HBoxContainer/UpgradeTwo/Description.text = provided_upgrades[1].description
	$ColorRect/HBoxContainer/UpgradeThree/Description.text = provided_upgrades[2].description

func upgrade_stats(id):
	get_tree().paused = false
	for f in provided_upgrades[id].upgrade_functions:
		var method = f.func_name
		var multiplier = f.multiplier
		Upgrades.call(method, multiplier)
	Upgrades.add_next_level_to_available(provided_upgrades[id])
	hide()
	Global.new_stats.emit()
	provided_upgrades = []

func get_three_upgrades():
	show()
	var copy_of_upgrades_list = []
	for u in Upgrades.upgrades_list:
		copy_of_upgrades_list.append(u)
	
	
	var number_of_upgrades_available = len(Upgrades.upgrades_list)
	var random1 = randi_range(0, number_of_upgrades_available -1)
	provided_upgrades.append(copy_of_upgrades_list[random1])

	copy_of_upgrades_list.erase(copy_of_upgrades_list[random1])
		
	number_of_upgrades_available -= 1
	var random2 = randi_range(0, number_of_upgrades_available -1)
	provided_upgrades.append(copy_of_upgrades_list[random2])

	copy_of_upgrades_list.erase(copy_of_upgrades_list[random2])
	
	number_of_upgrades_available -= 1
	var random3 = randi_range(0, number_of_upgrades_available -1)
	provided_upgrades.append(copy_of_upgrades_list[random3])

	copy_of_upgrades_list.erase(copy_of_upgrades_list[random3])

	
	set_ui_elements()


func _on_upgrade_one_button_button_down() -> void:
	upgrade_stats(0)


func _on_upgrade_two_button_button_down() -> void:
	upgrade_stats(1)


func _on_upgrade_three_button_button_down() -> void:
	upgrade_stats(2)

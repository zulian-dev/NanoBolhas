extends Node2D
const ENEMY = preload("res://prefabs/Enemy.tscn")
var enemies := []
@onready var label: Label = $Camera2D/Control/VBoxContainer/Panel/Label
@onready var button: Button = $Camera2D/Control/VBoxContainer/Panel/Button
@onready var points: Label = $Camera2D/Control/VBoxContainer/Panel/Points
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.hp_player = %HpPlayer
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	
	Globals.points = Globals.points - 1
	Globals.updateProgress()
	if Globals.points == 0:
		label.visible = true
		button.visible = true
		points.text = String.num_uint64(Globals.killed)
		points.visible = true
	if get_tree().get_nodes_in_group("ENEMIES").size() <= 30:
		var newenemy = ENEMY.instantiate()
		%EnemyPath.progress_ratio = randf()
		newenemy.position = %EnemyPath.global_position
		enemies.append(newenemy)
		self.add_child(newenemy)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu_with_animations.tscn")

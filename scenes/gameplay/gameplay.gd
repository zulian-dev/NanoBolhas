extends Node2D
const ENEMY = preload("res://prefabs/Enemy.tscn")
var enemies := []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.hp_player = %HpPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if Globals.points > 0:
		Globals.points -= 3
		Globals.updateProgress()
	if get_tree().get_nodes_in_group("ENEMIES").size() <= 10:
		var newenemy = ENEMY.instantiate()
		%EnemyPath.progress_ratio = randf()
		newenemy.position = %EnemyPath.global_position
		enemies.append(newenemy)
		self.add_child(newenemy)

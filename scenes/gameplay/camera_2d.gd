extends Camera2D
class_name CustomCamera2D

# Target node the camera is following
@export var TargetNode : Node2D = null
@onready var player: CharacterBody2D = %Player



func _ready() -> void:
	pass
	
func _process(_delta) -> void:
	set_position(player.get_position())	

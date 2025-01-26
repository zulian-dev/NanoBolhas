extends Node2D


@export var xp = 1
const MICRO_ORG = preload("res://assets/sprites/MicroOrg.png")
const POEIRA = preload("res://assets/sprites/poeira.png")
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand = randi() % 2
	if rand == 0:
		sprite_2d.texture = POEIRA
	else:
		sprite_2d.texture = MICRO_ORG
		
	pass # Replace with function body.


func get_xp():
	return self.xp
	
func die():
	self.queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

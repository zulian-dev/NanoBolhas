extends Node2D


@export var xp = 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_xp():
	return self.xp
	
func die():
	self.queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

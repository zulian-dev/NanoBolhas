extends CharacterBody2D

@export var speed = 400
@export var level = 0
@export var xp = 0
@export var xp_next = 5
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if Input.is_action_just_released("ui_accept"):
		add_xp()

func _physics_process(delta):
	get_input()
	move_and_slide()

func level_up(xpBase = 100, fatorCrescimento = 1.5):
	#var xpNecessario = xpBase * log(level) * fatorCrescimento;    
	#xp_next = floor(xpNecessario);
	xp = 0
	level += 1
	
func add_xp():
	xp += 1
	if xp >= xp_next:
		level_up()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)

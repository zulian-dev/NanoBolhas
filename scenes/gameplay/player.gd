extends CharacterBody2D

@export var speed = 400
@export var level = 0
@export var xp = 0
@export var xp_next = 5
@export var rotation_speed = 3
var rotation_direction

## movimentação padrao
#func get_input():
	#var input_direction = Input.get_vector("left", "right", "up", "down")
	#velocity = input_direction * speed
	#if Input.is_action_just_released("ui_accept"):
		#add_xp(1)
#
#func _physics_process(delta):
	#get_input()
	#move_and_slide()
	
## movimentação estilo carro
func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed
	if Input.is_action_just_released("ui_accept"):
		add_xp(1)
func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func level_up(xpBase = 100, fatorCrescimento = 1.5):
	#var xpNecessario = xpBase * log(level) * fatorCrescimento;    
	#xp_next = floor(xpNecessario);
	xp = 0
	level += 1
	
func add_xp(param_xp:int):
	print("GETXP")
	xp += param_xp
	if xp >= xp_next:
		level_up()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	body = body.get_parent()
	if body.is_in_group("ENEMIES"):
		if body.has_method("get_xp"):
			var xp = body.get_xp()
			self.add_xp(xp)
			body.die()

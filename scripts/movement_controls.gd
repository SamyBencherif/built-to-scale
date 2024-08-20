extends Node3D

@export var player : CharacterBody3D

var sizeBig = true
var targetScale = 3

func _physics_process(delta):
	
	# input movement
	if Input.is_action_pressed("move_x+"): player.velocity.x = 3
	elif Input.is_action_pressed("move_x-"): player.velocity.x = -3
	else: player.velocity.x = 0
	
	if Input.is_action_pressed("move_z+"): player.velocity.z = 3
	elif Input.is_action_pressed("move_z-"): player.velocity.z = -3
	else: player.velocity.z = 0
	
	if Input.is_action_pressed("jump") and player.is_on_floor():
		if sizeBig:
			player.velocity.y = 20
		else:
			player.velocity.y = 8
	
	if Input.is_action_just_pressed("sizeChange"):
		if sizeBig:
			targetScale = 1
			sizeBig = false
		else:
			targetScale = 3
			sizeBig = true
	
	player.scale.x = (targetScale + player.scale.x) / 2
	player.scale.y = (targetScale + player.scale.y) / 2
	player.scale.z = (targetScale + player.scale.z) / 2
	
	# gravity	
	player.velocity.y -= 20*delta
	
	# apply velocity
	player.move_and_slide()
	

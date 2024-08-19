extends Node3D

@export var camera : Camera3D
@export var target : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.look_at(target.global_position)

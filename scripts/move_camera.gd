extends Node3D

@export var camera : Camera3D
@export var player : CharacterBody3D
@export var target_pos : Vector3

var moveToTarget = false

func _physics_process(delta):
	if moveToTarget:
		var lerp = .03
		camera.position = (1 - lerp) * camera.position + lerp * target_pos

func _on_body_entered(body):
	if body == player:
		moveToTarget = true

func _on_body_exited(body):
	if body == player:
		moveToTarget = false

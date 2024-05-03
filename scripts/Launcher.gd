extends Node3D

const ROCKET = preload("res://scenes/rocket.tscn")
@onready var camera_3d = $"../Eyes/Camera3D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var rocket = ROCKET.instantiate()
		add_child(rocket)
		rocket.global_position = $"../Eyes/Camera3D/ShootDirection".global_position
		rocket.apply_impulse(($"../Eyes/Camera3D/ShootDirection".global_position - camera_3d.global_position) * 10.0)

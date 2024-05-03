extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func explosion():
	for body in $Area3D.get_overlapping_bodies():
		var direction = body.global_position - global_position
		if body is RigidBody3D:
			body.apply_impulse(direction * 10.0)
		if body is CharacterBody3D:
			body.velocity = direction * 10.0

func _on_body_entered(body):
	explosion()
	queue_free()

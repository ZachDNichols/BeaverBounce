extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_Platform_body_entered(body):
		#Check if player is on top
		if body.get_node("CharacterBody2D").global_position.y < global_position.y:
			queue_free()

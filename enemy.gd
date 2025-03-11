extends CharacterBody3D

const WALK_SPEED := 0.05
@onready var player : CharacterBody3D = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	look_at(player.position)
	velocity = Vector3(0, 0, WALK_SPEED)
	move_and_slide()

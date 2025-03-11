extends CanvasLayer
@onready var hand: AnimatedSprite2D = $Hand

var current_weapon : String = "gun"
var ammo := 2

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		if current_weapon == "knife":
			hand.play("knife_stab")
		elif current_weapon == "gun":
			if ammo > 0:
				hand.play("gun_shoot")
				ammo -= 1
			else:
				current_weapon = "knife"
				hand.play("knife_idle")


func _on_hand_animation_finished() -> void:
	if current_weapon == "knife":
			hand.play("knife_idle")
	elif current_weapon == "gun":
			hand.play("gun_idle")

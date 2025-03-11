extends CanvasLayer
@onready var hand: AnimatedSprite2D = $Hand

var current_weapon : String = "gun"
var ammo := 100

func _ready() -> void:
	hand.play(current_weapon + "_idle")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		if current_weapon == "knife":
			hand.play("knife_stab")
		else:
			if ammo > 0:
				hand.play(current_weapon + "_shoot")
				ammo -= 1
			else:
				current_weapon = "knife"
				hand.play("knife_idle")
	
	switch_weapon()

func _on_hand_animation_finished() -> void:
	hand.play(current_weapon + "_idle")


func switch_weapon():
	if Input.is_action_just_pressed("weapon_1"):
		current_weapon = "knife"
	elif Input.is_action_just_pressed("weapon_2"):
		current_weapon = "gun"
	elif Input.is_action_just_pressed("weapon_3"):
		current_weapon = "machine_gun"
	elif Input.is_action_just_pressed("weapon_4"):
		current_weapon = "mini_gun"	

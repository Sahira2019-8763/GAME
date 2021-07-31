extends CenterContainer



func _ready():
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://wordl/M_D1.tscn")

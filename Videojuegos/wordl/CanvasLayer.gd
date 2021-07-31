extends CanvasLayer



func _ready():
	pass # 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_pausa_pressed():
		if get_tree().paused == false:
			get_tree().paused = true
		else:
			get_tree().paused = false

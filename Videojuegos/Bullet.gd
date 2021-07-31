extends Area2D

var atak = 1
var speed = 750

func _process(delta):
	position -= Vector2(speed*delta, 0)

func _life_time():
	queue_free()


func _area_entered(area):
	if area.is_in_group("Globos"):
		area.distroy(atak)
		if area.indice == 4:
			Game.puntos += 10
		else:
			Game.puntos += 1
			Game._update_puntos()
		queue_free()

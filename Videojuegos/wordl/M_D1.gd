extends Node2D

var Globo = preload("res://Globos/Globos.tscn")
var red = true

func _ready():
	Game._update_puntos()
	
	
func _physics_process(delta):
	if Game.puntos >=0  and red:
		_reducir()
	if Game.puntos == 500:
		pass

	
func _reducir():
	red = false
	yield(get_tree().create_timer(10),"timeout")
	red = true
	Game.puntos -= 5
	Game._update_puntos()

func _timer_MD1():
	$Path2D/PathFollow2D.set_unit_offset(randf()*0.1)
	var globos = Globo.instance()
	globos.position.x = 350
	globos.position.y = 600 #$Path2D/PathFollow2D.global_position
	globos.add_to_group("Globos")
	get_parent().add_child(globos)
	
func _on_Timer_timeout():
	Game.tiempo += 1
	Game.update_time()

	#for i in Game.tiempo:
		#i += 10
		#i += i
		#print(i)
		#if Game.tiempo == i:
			
			#Game.puntos -= 5
			#Game._update_puntos()
		
	

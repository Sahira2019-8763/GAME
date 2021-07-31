extends KinematicBody2D

export(int) var Velocidad = 400
var Movimiento = Vector2()
var limite
var pre_bullet = preload("res://Bullet.tscn")
var can_shoop = true
var cd = 0.2

func _ready():
	pass

func _get_input():
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_up"): #Arriba
		Movimiento.y -= Velocidad
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += Velocidad
	#position += Movimiento * delta # actualizar las posiciones de x & y
	#position.y = clamp(position.y, 130, limite.y)

func shoop():
	if Input.is_action_pressed("Disparo") and can_shoop:
		var bala = pre_bullet.instance()
		bala.position = $posicion_laser.global_position
		get_parent().add_child(bala)
		can_shoop = false
		$Bala_cd.start(cd)

func _physics_process(delta):
	_get_input()
	shoop()
	Movimiento = move_and_slide(Movimiento)
	
func _bala_cd():
	can_shoop = true

	

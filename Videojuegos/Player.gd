extends Area2D
export(int) var Velocidad 
var Movimiento = Vector2()
var limite
signal golpe
var pre_bullet = preload("res://bullert.tscn")

func _ready():
	#hide()
	limite = get_viewport_rect().size


func _process(delta):
	
	Movimiento = Vector2()
	
	if Input.is_action_pressed("ui_up"): #Arriba
		Movimiento.y -= 1
		shoop()
	if Input.is_action_pressed("ui_down"): #Abajo
		Movimiento.y += 1
		shoop()
	
	if Movimiento.length() > 0: #Verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad # Normalizar la velocidad 
		
	position += Movimiento * delta # actualizar las posiciones de x & y
	position.y = clamp(position.y, 130, limite.y)

var readyToShoop = true
func shoop():
	if readyToShoop == true:
		var bullet = pre_bullet.instance()
		get_parent().call_deferred("add_child", bullet)
		bullet.position.x = self.position.x
		bullet.position.y = self.position.y
		readyToShoop = false
		yield(get_tree().create_timer(1),"timeout")
		readyToShoop = true
		

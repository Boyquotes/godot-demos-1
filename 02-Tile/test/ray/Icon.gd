extends Sprite2D

var speed = 400


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector.length() < 0:
		return
	velocity = input_vector * speed
	position += velocity * delta
	

func _physics_process(_delta: float) -> void:
	var ray_cast_2d: RayCast2D = $RayCast2D
	if ray_cast_2d.is_colliding():
		print(ray_cast_2d.get_collider())

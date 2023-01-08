extends Sprite2D

var speed = 400


func _ready() -> void:
	print(get_parent().get_node("Cup1").get_rid())
	print(get_parent().get_node("Cup2").get_rid())



func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector.length() < 0:
		return
	velocity = input_vector * speed
	position += velocity * delta
	

func _physics_process(_delta: float) -> void:
	ray_test3()
	

# 错误地使用了全局坐标
func ray_test1():
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var ray: PhysicsRayQueryParameters2D = PhysicsRayQueryParameters2D.create(Vector2(0, 0), Vector2(100, 0))
	var result = space_state.intersect_ray(ray)
	if !result.is_empty():
		print(result)
	
	
func ray_test2():
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var ray: PhysicsRayQueryParameters2D = PhysicsRayQueryParameters2D.create(to_global(Vector2(0, 0)), to_global(Vector2(100, 0)))
	# use global coordinates, not local to node
	var result: Dictionary = space_state.intersect_ray(ray)
	if !result.is_empty():
		print("------------------------------------------------------------")
		for key in result:
			print("key-------")
			print(key)
			print("value--------")
			print(result[key])
	
	
func ray_test3():
	var space_state = get_world_2d().direct_space_state
	var ray: PhysicsRayQueryParameters2D = PhysicsRayQueryParameters2D.create(to_global(Vector2(0, 0)), to_global(Vector2(100, 0)))
	# use global coordinates, not local to node
	var result: Dictionary = space_state.intersect_ray(ray)
	if !result.is_empty():
		print("------------------------------------------------------------")
		for key in result:
			print("key-------")
			print(key)
			print("value--------")
			print(result[key])

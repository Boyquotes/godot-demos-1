extends Node2D

@onready var tree : Sprite2D = $Tree

# Called when the node enters the scene tree for the first time.
func _ready():
	print(tree.texture.get_size())
	
	
func _process(delta):
	tree.material.set_shader_parameter("target", Vector2(0.0, 0.0))


func _on_snow_timer_timeout():
	var tar = Vector2.ZERO
	tar.x = randf_range(0.2, 0.8)
	tar.y = randf_range(0.2, 0.6)
	tree.material.set_shader_parameter("ratio", 1.0)
	tree.material.set_shader_parameter("target", tar)

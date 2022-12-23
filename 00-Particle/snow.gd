extends Node2D

@onready var tree : Sprite2D = $Tree

# Called when the node enters the scene tree for the first time.
func _ready():
	print(tree.texture.get_size())


func _on_snow_timer_timeout():
	var tar = Vector2.ZERO
	tar.x = randf_range(0.4, 0.6)
	tar.y = randf_range(0.3, 0.7)
	tree.material.set_shader_parameter("ratio", 1.0)
	tree.material.set_shader_parameter("target", tar);
	

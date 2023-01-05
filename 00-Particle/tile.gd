extends Node2D

@onready var tile_map = $TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(tile_map.get_used_cells(0))
#	print(tile_map.get_cell_source_id(0, Vector2i(5, 4)))
#	print(tile_map.get_cell_atlas_coords(0, Vector2i(5, 4)))
	print(tile_map.tile_set.get_source_count())
	print(tile_map.tile_set.get_source(0))
	print(tile_map.tile_set.get_source(0).get_scene_tiles_count())
	
	print(tile_map.tile_set.get_source(0).get_scene_tile_id(0))
	print(tile_map.tile_set.get_source(0).get_scene_tile_id(1))


func _input(event):
	if event.is_action_pressed("ui_accept"):
		var rand_pos = Vector2i(randi_range(0, 50), randi_range(0, 30))
		if tile_map.get_cell_source_id(0, rand_pos, false) == -1:
			tile_map.set_cell(0, rand_pos, 1, Vector2i.ZERO, 1)

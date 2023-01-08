extends Node2D

@onready var tile_map: TileMap = $TileMap
@onready var box: Sprite2D = $Box/Sprite2D
var tile_set: TileSet = null

enum Layer {
	Ground,
	Objects,
	Items,
	SceneItems
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = tile_map.tile_set
#	print(tile_set.get_source(1))
#	print(tile_set.get_source(2))
#	print(tile_set.get_source(3))
	var tree_pattern = tile_set.get_pattern(0)
	tile_map.set_pattern(Layer.Objects, Vector2i(0, -1), tree_pattern)
	
	var scene_collection : TileSetScenesCollectionSource = tile_set.get_source(3)
	print(scene_collection.get_scene_tiles_count())
	print(scene_collection.get_scene_tile_scene(1))
	print(scene_collection.get_scene_tile_display_placeholder(1))

#	for cell in tile_map.get_used_cells(Layer.SceneItems):
#		var cup : PackedScene = scene_collection.get_scene_tile_scene(1)
#		var cup_node = cup.instantiate()
#		cup_node.caution = "changed_cup"
#		cup_node.global_position = tile_map.map_to_local(cell)
#		get_parent().add_child.call_deferred(cup_node)
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		var tile = tile_map.local_to_map(get_global_mouse_position())
#		print(tile)
		if tile in tile_map.get_used_cells(1):
			var tile_data := tile_map.get_cell_tile_data(1, tile)
			if tile_data.get_custom_data("can_open"):
				print("can open")
				var altas_coord = tile_map.get_cell_atlas_coords(1, tile);
				tile_map.set_cell(1, tile, 2, Vector2i(altas_coord.x, altas_coord.y + 1))
			else:
				print("can't open")
		else:
			for i in range(tile_map.get_layers_count()):
				if tile in tile_map.get_used_cells(i):
					print("is not in layer 1")
					return
			print("is not in tilemap")
			


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		if box.region_rect.position == Vector2(96, 128):
			box.region_rect.position = Vector2(96, 144)
		elif box.region_rect.position == Vector2(96, 144):
			box.region_rect.position = Vector2(96, 128)

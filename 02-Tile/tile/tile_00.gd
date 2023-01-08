extends Node2D

@onready var tilemap : TileMap = $TileMap

func _test():
	pass

func _ready():
	print(tilemap.tile_set.tile_size)


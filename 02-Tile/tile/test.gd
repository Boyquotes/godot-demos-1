@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run():
	var ori = Vector2(0.0, 0.0)
	print(ori.move_toward(Vector2(2.0, 2.0), 8))

extends Node2D


@onready var nav_2d  : NavigationAgent2D = $Player/NavigationAgent2D
@onready var player  : CharacterBody2D   = $Player
@onready var line_2d : Line2D            = $Line2D

var speed := 150


func _process(delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir.length() > 0:
		player.velocity = dir * speed
		player.move_and_slide()
	

func _physics_process(delta):
	if nav_2d.is_navigation_finished() || nav_2d.get_final_location() == Vector2.ZERO:
		return
		
	var next_location = nav_2d.get_next_location()
	var direction = player.global_position.direction_to(next_location)
	
	nav_2d.set_velocity(direction * speed)
	player.velocity = direction * speed
	player.move_and_slide()
	

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
		
	var player_position = player.global_position
	var mouse_position = event.global_position
	nav_2d.set_target_location(mouse_position)
	nav_2d.get_next_location()
	var nav_path = nav_2d.get_nav_path()
	line_2d.points = nav_path

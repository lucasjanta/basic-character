class_name Player extends CharacterBody2D

@export var speed := 500.0
@export var gravity := 4000.0
@export var jump_impulse := 1800.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

var input_direction_x : int

func _physics_process(delta):
	input_direction_x = Input.get_axis("ui_left", "ui_right")
	change_sprite_direction()
	

func change_sprite_direction():
	if input_direction_x < 0:
		animated_sprite_2d.flip_h = true
	if input_direction_x > 0:
		animated_sprite_2d.flip_h = false

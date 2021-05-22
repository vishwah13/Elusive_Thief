extends KinematicBody2D

export (int) var Speed :int = 200;

export (float,0.01,0.1) var Friction :float = 0.01
export (float,0.1,1.0) var Acceleration :float = 0.1

var velocity = Vector2.ZERO

onready var PlayerLable = $Label

func _ready():
	PlayerLable.hide()

func get_input():
	var input = Vector2.ZERO
	if Input.is_action_pressed("right"):
		input.x +=1;
	if Input.is_action_pressed("left"):
		input.x -=1;
	if Input.is_action_pressed("down"):
		input.y +=1;
	if Input.is_action_pressed("up"):
		input.y -=1;
	
	return input
		

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity,direction.normalized()* Speed,Acceleration)
	else:
		velocity = lerp(velocity,Vector2.ZERO,Friction)
	velocity = move_and_slide(velocity)
	
func PlayerItemSFX():
	$ItemAudio.play()

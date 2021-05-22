extends PathFollow2D

export var Speed = 50


func _process(delta):
	set_offset(get_offset() + Speed *delta)

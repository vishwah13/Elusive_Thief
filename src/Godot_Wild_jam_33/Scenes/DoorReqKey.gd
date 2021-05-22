extends Area2D

onready var PlayerLable = get_node("../Player/Label")
onready var level = get_node("..")


func _process(delta):
	if Input.is_action_just_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.is_in_group("Player") and level.CheckForKey() == true:
				level.RemoveKey()
				queue_free()


func _on_DoorReqKey_body_exited(body):
		if body.name == "Player":
			PlayerLable.hide()


func _on_DoorReqKey_body_entered(body):
	if level.CheckForKey() == true:
		if body.name == "Player":
			PlayerLable.show()

extends Area2D

export var texture :Texture

onready var sprite =$Sprite
onready var IteamAudioPlay = get_node("../Player")

export (int) var Value = 5

onready var playerlable = get_node("../Player/Label")

func _ready():
	sprite.texture = texture

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.is_in_group("Player"):
				get_node("../Player/FCTManager").show_value(Value,false)
				get_node("..").update_HUD_Value(Value)
				IteamAudioPlay.PlayerItemSFX()
				queue_free()


func _on_item_body_entered(body):
	if body.is_in_group("Player"):
		playerlable.show()


func _on_item_body_exited(body):
	if body.is_in_group("Player"):
		playerlable.hide()

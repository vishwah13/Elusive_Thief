extends CanvasLayer

#signal scene_changed()

export (String,FILE,'*.tscn') var next_scene_path


onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play_backwards("Fade")

func change_scene(path := next_scene_path):
	animation_player.play("Fade")
	yield(animation_player,"animation_finished")
	assert(get_tree().change_scene(path)==OK)

	#emit_signal("scene_changed")

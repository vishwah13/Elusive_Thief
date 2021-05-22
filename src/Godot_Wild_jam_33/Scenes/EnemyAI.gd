extends KinematicBody2D

var player
var HUD

var rng = RandomNumberGenerator.new()

export var speed = 100
export var playerDetectDistance = 150
export var playerChaseSpeed = 120
export var patrolSpeed = 70

var direction : Vector2
var last_direction = Vector2(0, 1)
var bounce_countdown = 0

onready var BGMusic = get_node("../BGMusic")
onready var LoseSFX = get_node("../LoseSFX")


func _ready():
	player = get_node("../Player")
	HUD = get_node("../HUD")

	rng.randomize()


func _on_Timer_timeout():
	# Calculate the position of the player relative to the skeleton
	var player_relative_position = player.position - position
	speed = patrolSpeed
	
	if player_relative_position.length() <= 16:
		# If player is near, don't move but turn toward it
		direction = Vector2.ZERO
		last_direction = player_relative_position.normalized()
	elif player_relative_position.length() <= playerDetectDistance and bounce_countdown == 0:
		speed = playerChaseSpeed
		# If player is within range, move toward it
		direction = player_relative_position.normalized()
	elif bounce_countdown == 0:
		# If player is too far, randomly decide whether to stand still or where to move
		var random_number = rng.randf()
		if random_number < 0.05:
			direction = Vector2.ZERO
		elif random_number < 0.3:
			direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
			
	# Update bounce countdown
	if bounce_countdown > 0:
		bounce_countdown = bounce_countdown - 1
	
		
func _physics_process(delta):
	var movement = direction * speed * delta
	
	var collision = move_and_collide(movement)
	
	if collision != null and collision.collider.name != "Player":
		direction = direction.rotated(rng.randf_range(PI/4, PI/2))
		bounce_countdown = rng.randi_range(2, 5)


func _on_CatchPlayer_body_entered(body):
	if body.name == "Player":
		BGMusic.stop()
		LoseSFX.play()
		HUD._on_HUD_timeout()

extends KinematicBody2D

var speed
var velocity = Vector2.ZERO

func _ready():
	start_ball()

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		$CollisionSound.play()
		velocity = velocity.bounce(collision_object.normal)

func start_ball():
	speed = 600
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func stop_ball():
	speed = 0

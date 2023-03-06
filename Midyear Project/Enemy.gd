extends KinematicBody2D

const GRAVITY = 40
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += GRAVITY
	var Player = get_parent().get_node("Player")
	
	position.x += 2
	
	
	move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()

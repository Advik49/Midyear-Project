extends KinematicBody2D


const UP = Vector2(0, -1)
const GRAVITY = 40
const MAXFALLSPEED = 400
const MAXSPEED = 160
const JUMPFORCE = 600
const ACCEL = 20
const MOVESPEED = 250

var motion = Vector2()
var facing_right = true
var bullet_speed = 700
var bullet = preload("res://Bullet.tscn")
var direction = get_rotation()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	


	
	
	motion.y += GRAVITY
	if motion.y > MAXSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if Input.is_action_pressed("right"):

		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("left"):

		motion.x -= ACCEL
		facing_right = false 
		$AnimationPlayer.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("Idle")		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	if !is_on_floor():
		if motion.y <0:
			$AnimationPlayer.play("Jump")
		elif motion.y>0:
			$AnimationPlayer.play("Fall")
	motion = move_and_slide(motion, UP)


func fire():
	
	var bullet_instance = bullet.instance()

	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees= rotation_degrees
	if facing_right == true:
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(0))
	if facing_right == false:
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(PI))


		

	get_tree().get_root().call_deferred("add_child", bullet_instance)

func kill():
	get_tree().reload_current_scene()
	
	
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()

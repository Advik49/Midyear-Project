extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/World_Scene.tscn")


func _on_SettingsButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://SettingsMenu.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

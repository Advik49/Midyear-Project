tool

extends Area2D

export(String, FILE) var next_scene_path = ""



func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path must be set for the portal to work"
	else:
		return ""


# warning-ignore:unused_argument
func _on_SwitchScene_body_entered(body):
	if get_tree().change_scene(next_scene_path) != OK:
		# error handling here
		print("Error: Unavailable scene!")

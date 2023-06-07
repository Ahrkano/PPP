extends Control

func _ready():
	$AnimationPlayer.play("tela_inicial")

func _on_Start_pressed():
	get_tree().change_scene("res://LEVELS/FASE1.tscn")


func _on_Exit_pressed():
	get_tree().quit()

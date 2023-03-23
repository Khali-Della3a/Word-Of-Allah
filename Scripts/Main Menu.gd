extends Control

onready var animation = $ColorRect/AnimationPlayer

#This is for giving time for the transition
var time = 80
var trigger = false 

var fatiha = false
var baqara = false
var yaasin = false

func quiting_scene():
	trigger = true 
	animation.play("Fade out")
	
	
func _ready():
	animation.play("Fade In")




func _on_AlFatiha_pressed():
	quiting_scene()
	fatiha = true

func _on_AlBaqara_pressed():
	quiting_scene()
	baqara = true 
	
func _on_Yaasin_pressed():
	quiting_scene()
	yaasin = true

func _process(delta):
	if trigger == true :
		time -= 1
	if time <= 0 :
		if fatiha == true :
			get_tree().change_scene("res://Scenes/Suwar/Al-Fatiha.tscn")
		if baqara == true :
			get_tree().change_scene("res://Scenes/Suwar/Al-Baqara.tscn")
		





func _on_Quit_pressed():
	get_tree().quit()

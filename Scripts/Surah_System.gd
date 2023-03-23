extends Node2D

#Scroll bars
onready var hscroll = $HScrollBar
onready var vscroll = $VScrollBar
onready var sizescroll = $SizeScrollBar

#Buttons
onready var hleft = $Hleft
onready var hright = $Hright
onready var vup = $Vup
onready var vdown = $Vdown
onready var zoomin = $"Zoom in"
onready var zoomout = $"Zoom out"

#One for one-page surah and the other for long surah
onready var surahmulti = $"Camera2D/SurahMulitPage"
onready var surah = $"Camera2D/Surat Al-Fatiha"

onready var camera = $Camera2D
onready var animation = $"ColorRect/AnimationPlayer"
#Giving time fot the transition
var time = 80
var trigger = false

var main_menu = false

func quiting_scene():
	trigger = true
	animation.play("Fade out")
	print("quiting")

func _ready():
	animation.play("Fade In")
	if animation.is_playing() == true :
		print("animation is playing")
	
func _process(delta):
	#The navigation system
	camera.position.x = hscroll.value
	camera.position.y = -vscroll.value
	camera.scale.x = sizescroll.value
	camera.scale.y = sizescroll.value
	
	#Horizontal scroll bar
	if hleft.pressed == true :
		hscroll.value -= 1
	if hright.pressed == true :
		hscroll.value += 1
	#Vertical scroll bar	
	if vup.pressed == true :
		vscroll.value -= 1
	if vdown.pressed == true :
		vscroll.value += 1
	#zoom options
	if zoomin.pressed == true :
		sizescroll.value += 0.1
	if zoomout.pressed == true :
		sizescroll.value -= 0.1
		
	if trigger == true :
		time -= 1
		print("countdown")
	if time <= 0 :
		if main_menu == true :
			get_tree().change_scene("res://Scenes/Main Menu.tscn")
			print("changing scene")
	


func _on_Main_Menu_pressed():
	quiting_scene()
	main_menu = true

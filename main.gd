extends Node2D

var drawing := false
var startPos : Vector2
var curPos : Vector2
var drawWidth := 8.0
var maxPoints := 300
var drawnSpell : Spells
var maxX : int
var minX : int
var maxY : int
var minY : int
var boundingSize : int

enum Spells {FIREBALL, SHIELD, FIZZLE}

@onready var line := $SpellLine

func _ready() -> void:
	queue_redraw()

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Left_Click"):
		line.show()
		if !drawing:
			drawing = true
			startPos = get_global_mouse_position()
		else:
			curPos = get_global_mouse_position()
			if(startPos.distance_to(curPos) > 5):
				draw_spell()
	elif Input.is_action_just_released("Left_Click"):
		drawing = false
		drawnSpell = check_spell()
		
func draw_spell():
	var pos = get_global_mouse_position()
	for i in maxPoints:
		line.add_point(pos)
		
func check_spell() -> Spells:
	#TODO DFTs here
	#get_Point_Constraints()
	
	
	#Comment this out to leave drawing on screen
	line.clear_points()
	return Spells.FIREBALL
	
func get_Point_Constraints() -> void:
	maxX = 0
	minX = 9999
	maxY = 0
	minY = 9999
	
	boundingSize = 0
	
	for point in line.get_points():
		#print(point)
		if point.x > maxX:
			maxX = point.x
		elif point.x < minX:
			minX = point.x
			
		if point.y > maxY:
			maxY = point.y
		elif point.y < minY:
			minY = point.y
		
	boundingSize = maxi(maxX - minX, maxY - minY)
	print(str("( ", maxX, ",", maxY, " )" ))
	print(str("( ", minX, ",", minY, " )" ))
	print(boundingSize)
	
#func _draw():
		#if Input.is_action_pressed("Left_Click"):
			#if !drawing:
				#drawing = true
				#startPos = get_global_mouse_position()
			#else:
				#if(startPos.distance_to(get_global_mouse_position()) > 100):
					#draw_line(startPos, get_global_mouse_position(), Color.WHITE, drawWidth)
				#print(get_global_mouse_position())

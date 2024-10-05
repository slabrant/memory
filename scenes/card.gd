extends Node2D

@onready var shape_sprite_1: Sprite2D = $ShapeSprite1
@onready var shape_sprite_2: Sprite2D = $ShapeSprite2
@onready var shape_sprite_3: Sprite2D = $ShapeSprite3
@onready var shape_sprite_4: Sprite2D = $ShapeSprite4
@onready var shape_sprite_5: Sprite2D = $ShapeSprite5
@onready var shape_sprite_6: Sprite2D = $ShapeSprite6
@onready var shape_sprite_7: Sprite2D = $ShapeSprite7
@onready var shape_sprite_8: Sprite2D = $ShapeSprite8

var show_timer: Timer
var match_timer: Timer

@export var CARD_ID: int = 0:
	set(value):
		sprite = get("shape_sprite_" + "%d" % value)
		CARD_ID = value
@export var sprite: Sprite2D
@export var active: bool = false:
	set(value):
		if value:
			sprite.show()
		else:
			sprite.hide()
		active = value


func _ready() -> void:
	show_timer = get_parent().show_timer
	match_timer = get_parent().match_timer


func _on_button_pressed() -> void:
	if 0 < show_timer.time_left or 0 < match_timer.time_left:
		return
	
	if !get_parent().current_card:
		get_parent().current_card = self
		active = true
		return
	
	if get_parent().current_card == self:
		return
	
	if get_parent().current_card.CARD_ID == self.CARD_ID:
		get_parent().new_card = self
		active = true
		#get_parent().show_timer.stop()
		get_parent().match_timer.start()
	else:
		active = true
		get_parent().show_timer.start()

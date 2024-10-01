extends Node2D

@onready var shape_sprite_1: Sprite2D = $ShapeSprite1
@onready var shape_sprite_2: Sprite2D = $ShapeSprite2
@onready var shape_sprite_3: Sprite2D = $ShapeSprite3
@onready var shape_sprite_4: Sprite2D = $ShapeSprite4
@onready var shape_sprite_5: Sprite2D = $ShapeSprite5
@onready var shape_sprite_6: Sprite2D = $ShapeSprite6
@onready var shape_sprite_7: Sprite2D = $ShapeSprite7
@onready var shape_sprite_8: Sprite2D = $ShapeSprite8

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


func _on_button_pressed() -> void:
	if !get_parent().current_card:
		get_parent().current_card = self
		active = true
		return
		
	if get_parent().current_card.CARD_ID == self.CARD_ID:
		get_parent().current_card.queue_free()
		queue_free()
	get_parent().current_card = self
	active = true
	#if get_parent().current_card == self:
		#get_parent().current_card = null
		#return
	#active = true
	#print(get_parent().current_card)
	#if get_parent().current_card:
		#print(get_parent().current_card.CARD_ID)
		#if get_parent().current_card.CARD_ID == CARD_ID:
			#get_parent().current_card = null
			#get_parent().current_card.queue_free()
			#queue_free()
		#else:
			#get_parent().current_card.active = false
			#active = false
	#get_parent().current_card = self

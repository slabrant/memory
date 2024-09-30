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
		sprite.show()
		CARD_ID = value
		return
@export var sprite: Sprite2D

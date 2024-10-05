extends Node2D

const CARD = preload("res://scenes/card.tscn")
@onready var show_timer: Timer = $ShowTimer
@onready var match_timer: Timer = $MatchTimer

var current_card
var new_card
var cards: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var card_type_counts: Dictionary = {
		1: 0,
		2: 0,
		3: 0,
		4: 0,
		5: 0,
		6: 0,
		7: 0,
		8: 0
	}
	
	for i in range(4):
		for j in range(4):
			var new_card_id = 0
			while new_card_id == 0 or 1 < card_type_counts[new_card_id]:
				new_card_id = randi() % 8 + 1
			var new_card = add_card(Vector2(16 + 16*i,16 + 16*j), new_card_id)
			cards.append(new_card)
			card_type_counts[new_card_id] += 1


func add_card(position, card_id):
	var new_card = CARD.instantiate()
	new_card.position = position
	add_child(new_card)
	new_card.CARD_ID = card_id
	return new_card


func _on_show_timer_timeout() -> void:
	for card in cards:
		card.active = false
	current_card = null


func _on_match_timer_timeout() -> void:
	current_card.queue_free()
	cards.remove_at(cards.find(current_card))
	current_card = null
	new_card.queue_free()
	cards.remove_at(cards.find(new_card))
	new_card = null

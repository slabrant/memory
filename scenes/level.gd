extends Node2D

const CARD = preload("res://scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var card_type_counts = {
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
			var random_card = 0
			while random_card == 0 or 1 < card_type_counts[random_card]:
				random_card = randi() % 8 + 1
			add_card(Vector2(16 + 16*i,16 + 16*j), random_card)
			card_type_counts[random_card] += 1


func add_card(position, card_id):
	var new_card = CARD.instantiate()
	new_card.position = position
	add_child(new_card)
	new_card.CARD_ID = card_id

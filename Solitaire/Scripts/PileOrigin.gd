#PileOrigin
extends Node2D

# Define constants for the maximum pile size, number of piles, card dimensions, and spacing
const MAX_PILE_SIZE = 7
const NUM_PILES = 7
const CARD_WIDTH = 140  # Adjust this value based on your card width
const CARD_HEIGHT = 190  # Adjust this value based on your card height
const HORIZONTAL_SPACING = 20  # Space between piles

# Calculate the total width of each card with the spacing
const CARD_WIDTH_WITH_SPACING = CARD_WIDTH + HORIZONTAL_SPACING

var piles = {
	1: [], 2: [], 3: [], 4: [], 5: [], 6: [], 7: []
}

var horizontal_offset = 150  # Initial offset, adjust as needed
var vertical_offset = 150    # Initial offset, adjust as needed

func _ready():
	update_piles()

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_RIGHT:
				horizontal_offset += 10
				update_piles()
			elif event.scancode == KEY_LEFT:
				horizontal_offset -= 10
				update_piles()
			elif event.scancode == KEY_DOWN:
				vertical_offset += 10
				update_piles()
			elif event.scancode == KEY_UP:
				vertical_offset -= 10
				update_piles()

func update_piles():
	var screen_size = OS.get_screen_size()
	var max_card_height = 100  # Adjust as needed
	var spacing = min(screen_size.y / (MAX_PILE_SIZE + 1), max_card_height)

	for pile_number in piles.keys():
		var pile = piles[pile_number]
		var pile_position_y = screen_size.y / 4 + vertical_offset

		for i in range(len(pile)):
			var card = pile[i]
			var position_offset = Vector2(0, i * spacing)
			card.position = Vector2(pile_number * CARD_WIDTH_WITH_SPACING + horizontal_offset, pile_position_y) + position_offset
			if card.get_parent():
				card.get_parent().remove_child(card)
			add_child(card)

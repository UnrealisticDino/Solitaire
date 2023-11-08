#Tableau
extends Node2D

# A dictionary to hold the seven piles
var piles = {
	1: [],
	2: [],
	3: [],
	4: [],
	5: [],
	6: [],
	7: []
}

func deal_cards_to_pile(deck, pile_number, card_count):
	var pile_origin = get_node("PileOrigin")  # Adjust the path according to your node structure
	assert(pile_number >= 1 && pile_number <= 7, "Invalid pile number: should be between 1 and 7.")
	assert(pile_origin, "Pile origin node not found.")
	var pile = piles[pile_number]
	var card_width = 100  # Assume a card width of 100 pixels or obtain this value dynamically
	var padding = 20  # Space between piles
	
	for i in range(card_count):
		var card = deck.deal_card()
		if card:
			# Calculate the position based on the origin point
			var x_position = pile_origin.position.x + (pile_number - 1) * (card_width + padding)
			var y_position = pile_origin.position.y + i * 30  # Your Y offset
			card.position = Vector2(x_position, y_position)
			card.show_front() if i == card_count - 1 else card.show_back()
			if card.get_parent():
				card.get_parent().remove_child(card)  # Remove card from its current parent
			add_child(card)
			pile.append(card)

func deal_cards(deck):
	for pile_number in range(1, 8):  # 1 through 7 for each pile
		deal_cards_to_pile(deck, pile_number, pile_number)

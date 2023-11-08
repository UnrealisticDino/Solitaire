#Deck
extends Node

const SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]
var cards = []

func _ready():
	initialize_deck()  # Call the initialization function

func initialize_deck():
	for suit_index in range(4):  # 0 to 3 for the four suits
		for value in range(1, 14):  # 1 to 13 for Ace to King
			var card_scene = preload("res://Solitaire/Scenes/Card.tscn")
			var card = card_scene.instance()
			card.set_card(SUITS[suit_index], value)
			add_child(card)
			cards.append(card)
	shuffle()

func shuffle():
	cards.shuffle()  # This shuffles the array in place

func deal_card():
	if cards.size() > 0:
		return cards.pop_front()  # Removes the first card and returns it
	else:
		print("No more cards in the deck.")
		return null

func get_remaining_cards():
	return cards

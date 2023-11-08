# GameBoard.gd
extends Node2D

const DeckScene = preload("res://Solitaire/Scenes/Deck.tscn")
const TableauScene = preload("res://Solitaire/Scenes/Tableau.tscn")

var deck
var tableau

func _ready():
	setup_deck()
	setup_tableau()
	deal_cards()

func setup_deck():
	deck = DeckScene.instance()
	add_child(deck)
	deck.initialize_deck()  # Assuming your Deck scene has an initialize_deck() function

func setup_tableau():
	tableau = TableauScene.instance()
	add_child(tableau)

func deal_cards():
	tableau.deal_cards(deck)

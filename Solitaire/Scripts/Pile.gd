#Pile
extends Node2D

signal card_added(card)

var pile = []

func add_card(card) -> bool:
	if can_accept_card(card):
		pile.append(card)
		emit_signal("card_added", card)
		return true
	return false

func can_accept_card(card) -> bool:
	# Implement your Solitaire rules here
	return true

func take_top_card() -> Object:
	if pile.size() > 0:
		return pile.pop_back()
	return null

func get_top_card() -> Object:
	if pile.size() > 0:
		return pile[-1]
	return null

func is_empty() -> bool:
	return pile.size() == 0

func clear_pile():
	pile.clear()

func get_card_count() -> int:
	return get_child_count()

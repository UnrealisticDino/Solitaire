#Card
extends Node2D

export (String, "Hearts", "Diamonds", "Clubs", "Spades") var suit
export (int) var rank
export (Texture) var card_sheet

var is_face_up = false
const CARD_WIDTH = 1924 / 13
const CARD_HEIGHT = 1150 / 5
var sprite

func _ready():
	sprite = $Sprite
	if sprite:
		var deck_texture = preload("res://Solitaire/Sprites/Deck.png")
		sprite.texture = deck_texture
		update_card_texture()
	else:
		print("Sprite not found")

func set_card(suit_name: String, rank_value: int):
	suit = suit_name
	rank = rank_value
	if is_inside_tree():
		update_card_texture()
	else:
		call_deferred("update_card_texture")

func update_card_texture():
	if sprite:
		sprite.region_enabled = true

		var suit_indices = {"Clubs": 0, "Diamonds": 1, "Hearts": 2, "Spades": 3}
		var card_pos = Vector2()

		if suit in suit_indices:
			card_pos.x = (rank - 1) * CARD_WIDTH
			card_pos.y = suit_indices[suit] * CARD_HEIGHT
			sprite.region_rect = Rect2(card_pos, Vector2(CARD_WIDTH, CARD_HEIGHT))
		else:
			print("Invalid suit: ", suit)
			# Here you could set a default or error texture to indicate an issue visually
			# For example, setting the sprite to a 'missing texture' graphic
			# Remember to provide such a texture in your project
			# var error_texture = preload("res://path_to_error_texture.png")
			# sprite.texture = error_texture
		
		# Flip to the back if not face up
		if not is_face_up:
			sprite.region_rect = Rect2(Vector2(2 * CARD_WIDTH, 4 * CARD_HEIGHT), Vector2(CARD_WIDTH, CARD_HEIGHT))

func show_front():
	is_face_up = true
	update_card_texture()

func show_back():
	is_face_up = false
	update_card_texture()

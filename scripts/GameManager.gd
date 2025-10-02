extends Node

## Game Manager - Core game logic and state management
## Handles game flow, win/lose conditions, and global game state

# Game states
enum GameState {
	MENU,
	LOBBY,
	PLAYING,
	PAUSED,
	GAME_OVER
}

# Player data structure
class PlayerData:
	var player_id: int
	var player_name: String
	var lives: int = 5
	var score: int = 0
	var is_alive: bool = true
	
	func _init(id: int, name: String):
		player_id = id
		player_name = name

# Game configuration
const MAX_PLAYERS: int = 8
const STARTING_LIVES: int = 5
const GAME_DURATION_MINUTES: int = 20

# Game state
var current_state: GameState = GameState.MENU
var players: Dictionary = {}  # player_id -> PlayerData
var game_time: float = 0.0
var game_duration: float = GAME_DURATION_MINUTES * 60.0  # Convert to seconds

# Signals
signal game_state_changed(new_state: GameState)
signal player_joined(player_id: int, player_name: String)
signal player_left(player_id: int)
signal player_died(player_id: int)
signal player_eliminated(player_id: int)
signal game_started()
signal game_ended(winner_id: int)

func _ready():
	print("GameManager initialized")

func _process(delta: float):
	if current_state == GameState.PLAYING:
		game_time += delta
		
		# Check win condition: time limit reached
		if game_time >= game_duration:
			_end_game_by_time()
		
		# Check win condition: only one player left
		var alive_count = _count_alive_players()
		if alive_count <= 1:
			_end_game_by_elimination()

## Change game state
func change_state(new_state: GameState) -> void:
	if current_state != new_state:
		current_state = new_state
		game_state_changed.emit(new_state)
		print("Game state changed to: ", GameState.keys()[new_state])

## Add a player to the game
func add_player(player_id: int, player_name: String) -> bool:
	if players.size() >= MAX_PLAYERS:
		print("Cannot add player: Max players reached")
		return false
	
	if players.has(player_id):
		print("Player already exists: ", player_id)
		return false
	
	var player_data = PlayerData.new(player_id, player_name)
	players[player_id] = player_data
	player_joined.emit(player_id, player_name)
	print("Player added: ", player_name, " (ID: ", player_id, ")")
	return true

## Remove a player from the game
func remove_player(player_id: int) -> void:
	if players.has(player_id):
		players.erase(player_id)
		player_left.emit(player_id)
		print("Player removed: ", player_id)

## Player loses a life
func player_lose_life(player_id: int) -> void:
	if not players.has(player_id):
		return
	
	var player_data: PlayerData = players[player_id]
	player_data.lives -= 1
	player_died.emit(player_id)
	
	print("Player ", player_data.player_name, " lost a life. Lives remaining: ", player_data.lives)
	
	if player_data.lives <= 0:
		player_data.is_alive = false
		player_eliminated.emit(player_id)
		print("Player ", player_data.player_name, " has been eliminated!")

## Add score to a player
func add_player_score(player_id: int, points: int) -> void:
	if players.has(player_id):
		players[player_id].score += points
		print("Player ", players[player_id].player_name, " scored ", points, " points")

## Start the game
func start_game() -> void:
	game_time = 0.0
	current_state = GameState.PLAYING
	game_started.emit()
	print("Game started!")

## End game due to time limit
func _end_game_by_time() -> void:
	var winner_id = _get_player_with_most_lives()
	_end_game(winner_id)

## End game due to elimination
func _end_game_by_elimination() -> void:
	var winner_id = _get_last_alive_player()
	_end_game(winner_id)

## End the game
func _end_game(winner_id: int) -> void:
	current_state = GameState.GAME_OVER
	game_ended.emit(winner_id)
	
	if winner_id != -1 and players.has(winner_id):
		print("Game ended! Winner: ", players[winner_id].player_name)
	else:
		print("Game ended! No winner (tie or no players)")

## Count alive players
func _count_alive_players() -> int:
	var count = 0
	for player_data in players.values():
		if player_data.is_alive:
			count += 1
	return count

## Get last alive player
func _get_last_alive_player() -> int:
	for player_id in players.keys():
		if players[player_id].is_alive:
			return player_id
	return -1

## Get player with most lives (for time-based win)
func _get_player_with_most_lives() -> int:
	var max_lives = -1
	var winner_id = -1
	
	for player_id in players.keys():
		var player_data: PlayerData = players[player_id]
		if player_data.lives > max_lives:
			max_lives = player_data.lives
			winner_id = player_id
		elif player_data.lives == max_lives:
			# Tie-breaker: highest score
			if players.has(winner_id) and player_data.score > players[winner_id].score:
				winner_id = player_id
	
	return winner_id

## Get player data
func get_player_data(player_id: int) -> PlayerData:
	return players.get(player_id)

## Get all players
func get_all_players() -> Array:
	return players.values()

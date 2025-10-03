extends Node

## Network Manager - Handles multiplayer networking
## Manages connections, player synchronization, and network events

# Network configuration
const DEFAULT_PORT: int = 7777
const MAX_CLIENTS: int = 8

# Network state
var is_server: bool = false
var peer: ENetMultiplayerPeer = null
var connected_players: Dictionary = {}  # peer_id -> player_name

# Signals
signal server_created()
signal server_creation_failed()
signal connected_to_server()
signal connection_failed()
signal player_connected(peer_id: int, player_name: String)
signal player_disconnected(peer_id: int)

func _ready():
	print("NetworkManager initialized")
	
	# Connect to multiplayer signals
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_connection_failed)
	multiplayer.server_disconnected.connect(_on_server_disconnected)

## Create a server
func create_server(port: int = DEFAULT_PORT) -> bool:
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, MAX_CLIENTS)
	
	if error != OK:
		print("Failed to create server: ", error)
		server_creation_failed.emit()
		return false
	
	multiplayer.multiplayer_peer = peer
	is_server = true
	
	print("Server created on port ", port)
	server_created.emit()
	
	# Add local player as host
	var local_peer_id = multiplayer.get_unique_id()
	_register_player(local_peer_id, "Host")
	
	return true

## Join a server
func join_server(address: String, port: int = DEFAULT_PORT) -> bool:
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(address, port)
	
	if error != OK:
		print("Failed to connect to server: ", error)
		connection_failed.emit()
		return false
	
	multiplayer.multiplayer_peer = peer
	is_server = false
	
	print("Connecting to server at ", address, ":", port)
	return true

## Disconnect from network
func disconnect_network() -> void:
	if peer:
		peer.close()
		peer = null
	
	multiplayer.multiplayer_peer = null
	is_server = false
	connected_players.clear()
	print("Disconnected from network")

## Register a player in the game
func _register_player(peer_id: int, player_name: String) -> void:
	connected_players[peer_id] = player_name
	GameManager.add_player(peer_id, player_name)
	player_connected.emit(peer_id, player_name)
	print("Player registered: ", player_name, " (Peer ID: ", peer_id, ")")

## Unregister a player from the game
func _unregister_player(peer_id: int) -> void:
	if connected_players.has(peer_id):
		var player_name = connected_players[peer_id]
		connected_players.erase(peer_id)
		GameManager.remove_player(peer_id)
		player_disconnected.emit(peer_id)
		print("Player unregistered: ", player_name, " (Peer ID: ", peer_id, ")")

## RPC: Register player on server
@rpc("any_peer", "call_remote", "reliable")
func register_player(player_name: String) -> void:
	var peer_id = multiplayer.get_remote_sender_id()
	_register_player(peer_id, player_name)
	
	# Server broadcasts this player to all other clients
	if is_server:
		for other_peer_id in connected_players.keys():
			if other_peer_id != peer_id and other_peer_id != 1:  # Don't send to self or server
				rpc_id(other_peer_id, "register_player_on_client", peer_id, player_name)
		
		# Send all existing players to the new player
		for existing_peer_id in connected_players.keys():
			if existing_peer_id != peer_id:
				rpc_id(peer_id, "register_player_on_client", existing_peer_id, connected_players[existing_peer_id])

## RPC: Register player on client
@rpc("authority", "call_remote", "reliable")
func register_player_on_client(peer_id: int, player_name: String) -> void:
	_register_player(peer_id, player_name)

## RPC: Sync player position
@rpc("any_peer", "unreliable")
func sync_player_position(position: Vector3, rotation: Vector3) -> void:
	var peer_id = multiplayer.get_remote_sender_id()
	# This will be handled by the player node itself
	# Just a placeholder for network sync structure

## RPC: Sync player health
@rpc("any_peer", "call_remote", "reliable")
func sync_player_health(health: float, lives: int) -> void:
	var peer_id = multiplayer.get_remote_sender_id()
	# Update player health in GameManager or player node

## RPC: Sync ghoul state
@rpc("authority", "unreliable")
func sync_ghoul_state(ghoul_id: int, position: Vector3, state: int) -> void:
	# Server broadcasts ghoul state to clients
	pass

## RPC: Start game (server only)
@rpc("authority", "call_local", "reliable")
func start_game_network() -> void:
	GameManager.start_game()

## Signal handlers
func _on_peer_connected(peer_id: int) -> void:
	print("Peer connected: ", peer_id)
	
	if not is_server:
		# Client: Register with server
		rpc_id(1, "register_player", "Player_" + str(peer_id))

func _on_peer_disconnected(peer_id: int) -> void:
	print("Peer disconnected: ", peer_id)
	_unregister_player(peer_id)

func _on_connected_to_server() -> void:
	print("Successfully connected to server")
	connected_to_server.emit()
	
	# Register local player with server
	var local_name = "Player_" + str(multiplayer.get_unique_id())
	rpc_id(1, "register_player", local_name)

func _on_connection_failed() -> void:
	print("Connection to server failed")
	connection_failed.emit()

func _on_server_disconnected() -> void:
	print("Server disconnected")
	disconnect_network()

## Get local peer ID
func get_local_peer_id() -> int:
	return multiplayer.get_unique_id()

## Check if local player is server
func is_network_server() -> bool:
	return is_server

## Get all connected players
func get_connected_players() -> Dictionary:
	return connected_players

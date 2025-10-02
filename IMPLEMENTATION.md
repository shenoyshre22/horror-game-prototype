# Implementation Notes - Horror School Survival

## Project Structure Overview

```
horror-game-prototype/
├── project.godot              # Main Godot project configuration
├── icon.svg                   # Project icon
│
├── scenes/                    # All game scenes (.tscn files)
│   ├── MainMenu.tscn         # Main menu with play, settings, quit
│   ├── Lobby.tscn            # Multiplayer lobby for host/join
│   ├── GameLevel.tscn        # Main game level (school building)
│   ├── Player.tscn           # Player character scene
│   ├── Ghoul.tscn            # Base ghoul enemy scene
│   ├── Weapon.tscn           # Weapon pickup scene
│   └── UI/                   # UI-related scenes
│       ├── HUD.tscn          # In-game HUD
│       ├── PauseMenu.tscn    # Pause menu
│       └── GameOver.tscn     # Game over screen
│
├── scripts/                   # All GDScript files
│   ├── GameManager.gd        # Singleton: Game state management
│   ├── NetworkManager.gd     # Singleton: Multiplayer networking
│   ├── Player.gd             # Player controller script
│   ├── Torch.gd              # Flashlight/torch system
│   ├── Weapon.gd             # Base weapon class
│   ├── Ghoul.gd              # Base ghoul AI
│   └── AI/                   # AI-specific scripts
│       ├── Wanderer.gd       # Wanderer ghoul AI
│       ├── Stalker.gd        # Stalker ghoul AI
│       └── Screamer.gd       # Screamer ghoul AI
│
├── assets/                    # All game assets
│   ├── models/               # 3D models (.gltf, .obj)
│   │   ├── characters/
│   │   ├── ghouls/
│   │   ├── weapons/
│   │   └── environment/
│   ├── textures/             # Textures and materials
│   ├── audio/                # Audio files
│   │   ├── music/
│   │   ├── sfx/
│   │   └── ambient/
│   └── ui/                   # UI assets (icons, fonts)
│
├── README.md                  # Project overview
├── GAME_DESIGN.md            # Complete game design document
├── GAMEPLAY.md               # Detailed gameplay mechanics
├── ROADMAP.md                # Development roadmap
└── IMPLEMENTATION.md         # This file: Implementation notes
```

## Core Systems Implementation

### 1. GameManager (Singleton)
**File**: `scripts/GameManager.gd`  
**Purpose**: Central game state management

**Key Features**:
- Game state machine (MENU, LOBBY, PLAYING, PAUSED, GAME_OVER)
- Player data tracking (lives, scores, alive status)
- Win/lose condition checking
- Event system via signals

**Usage**:
```gdscript
# Add a player
GameManager.add_player(1, "PlayerName")

# Player loses a life
GameManager.player_lose_life(1)

# Start the game
GameManager.start_game()

# Listen to events
GameManager.game_ended.connect(_on_game_ended)
```

### 2. NetworkManager (Singleton)
**File**: `scripts/NetworkManager.gd`  
**Purpose**: Handles all multiplayer networking

**Key Features**:
- Server creation and client connection
- Player registration and synchronization
- RPC calls for game state sync
- Network event handling

**Usage**:
```gdscript
# Create server
NetworkManager.create_server(7777)

# Join server
NetworkManager.join_server("127.0.0.1", 7777)

# Listen to events
NetworkManager.player_connected.connect(_on_player_connected)
```

### 3. Player Controller
**File**: `scripts/Player.gd`  
**Scene**: `scenes/Player.tscn`

**Node Structure**:
```
Player (CharacterBody3D)
├── CollisionShape3D
├── Camera3D
│   └── Torch (SpotLight3D)
├── WeaponHolder (Node3D)
│   └── CurrentWeapon (Node3D)
├── AnimationPlayer
└── HitBox (Area3D)
    └── CollisionShape3D
```

**Key Features**:
- WASD movement with CharacterBody3D
- Mouse look camera control
- Sprint with stamina system
- Health, lives, and sanity tracking
- Weapon system integration
- Torch toggle functionality

**Implementation Priority**:
1. Basic movement (WASD)
2. Mouse look
3. Sprint and stamina
4. Health system
5. Weapon attachment
6. Torch system

### 4. Torch/Flashlight System
**File**: `scripts/Torch.gd`  
**Node**: SpotLight3D attached to Camera3D

**Key Features**:
- Toggle on/off with 'F' key
- Battery depletion over time
- Battery UI indicator
- Light intensity and range settings

**Properties**:
```gdscript
var is_on: bool = false
var battery_life: float = 300.0  # 5 minutes in seconds
var battery_drain_rate: float = 1.0  # Per second
var max_battery: float = 300.0
```

### 5. Weapon System
**File**: `scripts/Weapon.gd`  
**Scene**: `scenes/Weapon.tscn`

**Base Weapon Class**:
```gdscript
class_name Weapon
extends Node3D

enum WeaponType { MELEE, RANGED }

var weapon_name: String
var weapon_type: WeaponType
var damage: float
var durability: float
var max_durability: float
var attack_speed: float
```

**Weapon Types**:
- **Melee**: Raycast-based hit detection
- **Ranged**: Projectile-based or hitscan

**Implementation**:
1. Base weapon class
2. Melee weapons (pipe, axe)
3. Ranged weapons (slingshot, crossbow)
4. Pickup system
5. Weapon switching
6. Durability system

### 6. Ghoul AI System
**File**: `scripts/Ghoul.gd`  
**Scene**: `scenes/Ghoul.tscn`

**Node Structure**:
```
Ghoul (CharacterBody3D)
├── CollisionShape3D
├── MeshInstance3D
├── NavigationAgent3D
├── DetectionArea (Area3D)
│   └── CollisionShape3D
├── AttackRange (Area3D)
│   └── CollisionShape3D
└── AnimationPlayer
```

**AI States**:
- IDLE: Standing still
- PATROL: Walking along waypoints
- CHASE: Following player
- ATTACK: Attacking player
- DEAD: Death animation and cleanup

**Detection**:
- Vision cone for player detection
- Sound-based detection (footsteps, gunshots)
- Light attraction (torch, flashlight)

**Navigation**:
- Use Godot's NavigationAgent3D
- Set up NavigationRegion3D in level
- Calculate paths to player position

### 7. Lighting & Blackout System

**Environment Lighting**:
- WorldEnvironment node with ambient light
- Point lights for ceiling lights
- Spot lights for emergency lights

**Blackout Implementation**:
```gdscript
# In level script
var lights: Array = []
var blackout_timer: Timer
var blackout_active: bool = false

func trigger_blackout():
    blackout_active = true
    for light in lights:
        light.visible = false
    # Activate emergency lights
    # Increase ghoul spawn rate

func end_blackout():
    blackout_active = false
    for light in lights:
        light.visible = true
```

### 8. Floor Transition System

**Stairwell/Elevator**:
- Area3D for detection
- Require key item or switch activation
- Fade out/in transition
- Load new floor or move player

**Safe Rooms**:
- Designated areas per floor
- Green light indicator
- Ghoul-proof (no spawns inside)
- Health/sanity regeneration

## Level Design Guidelines

### School Layout (PES-Inspired)

**Ground Floor**:
- Main entrance hall (spawn point)
- Cafeteria
- Gymnasium
- Office area
- Stairs/elevator to 1st floor
- Basement access (locked initially)

**1st Floor**:
- Multiple classrooms (6-8)
- Library
- Teacher's lounge
- Bathrooms
- Safe room (marked with green light)

**2nd Floor**:
- Classrooms (6-8)
- Staff rooms
- Storage rooms
- Computer lab
- Safe room

**3rd Floor**:
- Science labs
- Art room
- Music room
- Principal's office (boss spawn)
- Rooftop access (optional)
- Safe room

**Basement**:
- Boiler room
- Maintenance area
- Storage
- Dark corridors
- Legendary weapon spawns
- No safe room (highest risk)

### Environment Details

**Props**:
- Desks and chairs
- Lockers
- Bookshelves
- Lab equipment
- Sports equipment
- Broken furniture

**Lighting**:
- Ceiling lights (can go out during blackout)
- Emergency lights (dim, always on)
- Exit signs (green glow)
- Window light (time-based)

**Interactive Objects**:
- Doors (open/close, lock/unlock)
- Lockers (search for items)
- Light switches
- Generators (basement)
- Windows (breakable)

## Audio Implementation

### Sound Categories

**Ambient Sounds**:
- Wind howling
- Creaking wood
- Distant footsteps
- Dripping water
- Flickering lights

**Player Sounds**:
- Footsteps (different surfaces)
- Breathing (heavy when low stamina)
- Weapon sounds
- Item pickup

**Ghoul Sounds**:
- Breathing/growling
- Footsteps
- Attack sounds
- Death sounds
- Screamer scream

**Music**:
- Menu theme (eerie, calm)
- Exploration (ambient, tense)
- Chase theme (intense, fast)
- Boss battle (epic, dark)
- Victory/defeat stingers

**Audio System**:
- Use AudioStreamPlayer3D for positional audio
- AudioStreamPlayer for music and UI sounds
- Audio bus for mixing (Master, Music, SFX, Ambient)

## UI/HUD Implementation

### In-Game HUD
**Elements**:
- Health bar (top left)
- Lives counter (hearts or number)
- Stamina bar (below health)
- Sanity meter (with effects)
- Current weapon display
- Ammo counter (if ranged)
- Weapon durability
- Battery indicator
- Minimap (optional)
- Game timer
- Player count/alive

### Pause Menu
- Resume
- Settings
- Controls
- Quit to menu

### Game Over Screen
- Winner announcement
- Final scores
- Player statistics
- Play again / Return to menu

## Optimization Tips

### Performance
1. **LOD (Level of Detail)**:
   - Use LOD for distant objects
   - Reduce polygon count for far meshes

2. **Occlusion Culling**:
   - Use OccluderInstance3D for rooms
   - Don't render what player can't see

3. **Lighting**:
   - Limit real-time lights
   - Use baked lightmaps where possible
   - Optimize shadow resolution

4. **AI**:
   - Limit active AI count
   - Use simple patrol paths
   - Update AI less frequently when far from player

5. **Networking**:
   - Only sync what's necessary
   - Use unreliable RPCs for position
   - Use reliable RPCs for important events

### Memory
- Unload unused resources
- Use object pooling for frequently spawned objects
- Optimize texture sizes

## Testing Guidelines

### Single Player Testing
1. Player movement and controls
2. Weapon pickup and usage
3. Ghoul AI behavior
4. Lighting and blackouts
5. Floor transitions
6. Win/lose conditions

### Multiplayer Testing
1. Host/join functionality
2. Player synchronization
3. Ghoul sync across clients
4. Item pickup sync
5. Blackout sync
6. Network lag tolerance

### Balance Testing
1. Weapon damage vs ghoul health
2. Resource spawn rates
3. Blackout frequency and duration
4. Game duration
5. Player lives count

## Common Issues & Solutions

### Issue: Player falls through floor
**Solution**: Ensure all floor meshes have StaticBody3D with CollisionShape3D

### Issue: AI navigation not working
**Solution**: Bake NavigationRegion3D mesh, ensure navigation layer is set correctly

### Issue: Network desync
**Solution**: Use authoritative server model, sync critical data with reliable RPCs

### Issue: Performance drops during blackouts
**Solution**: Reduce shadow quality, limit particle effects, optimize light count

### Issue: Ghouls can't find player
**Solution**: Check NavigationAgent3D settings, ensure path calculation is working

## Next Steps

### Immediate Priority (MVP)
1. ✅ Create project structure
2. ✅ Set up GameManager
3. ✅ Set up NetworkManager
4. ⏳ Implement player controller
5. ⏳ Create basic level geometry
6. ⏳ Implement torch system
7. ⏳ Create basic ghoul AI
8. ⏳ Implement weapon system

### After MVP
- Add multiple ghoul types
- Implement blackout system
- Create multi-floor level
- Add more weapons
- Polish audio and visuals
- Add online multiplayer

## Useful Godot Resources

### Documentation
- [CharacterBody3D](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html)
- [NavigationAgent3D](https://docs.godotengine.org/en/stable/classes/class_navigationagent3d.html)
- [Multiplayer API](https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html)
- [Lighting](https://docs.godotengine.org/en/stable/tutorials/3d/lights_and_shadows.html)

### Community Resources
- [Godot FPS Tutorial](https://www.youtube.com/results?search_query=godot+fps+tutorial)
- [Godot AI Navigation](https://www.youtube.com/results?search_query=godot+ai+navigation)
- [Godot Multiplayer](https://www.youtube.com/results?search_query=godot+multiplayer+tutorial)

---

## Development Log

### Session 1 (Current)
- ✅ Created project structure
- ✅ Set up project.godot configuration
- ✅ Created GameManager singleton
- ✅ Created NetworkManager singleton
- ✅ Wrote comprehensive documentation
- 📝 Next: Implement player controller

---

**Last Updated**: 2024  
**Current Phase**: Phase 1 - MVP Development  
**Status**: Documentation Complete, Starting Implementation

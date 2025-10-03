# Horror School Survival - Game Design Document

## Game Overview
**Genre**: Multiplayer Survival Horror  
**Concept**: A mix of SmashKarts and Short Creepy Stories (Roblox), set in an abandoned school inspired by PES  
**Platform**: PC (Godot Engine)  
**Mode**: Multiplayer (2-8 players recommended)

## Core Game Loop
Players spawn in an abandoned school and must survive waves of ghoul attacks while progressing through different floors. The game features random blackouts where players must rely on torches or headlights for visibility. The last player standing wins.

## Key Features

### 1. Survival Mechanics
- **Lives System**: Each player starts with 5 lives
- **Win Condition**: Last player with remaining lives wins
- **Night Survival**: Players must survive until dawn (configurable time limit)

### 2. Multi-Floor School Setting
- **Floor-Based Progression**: School has multiple floors (Ground, 1st, 2nd, 3rd floors + basement)
- **PES-Inspired Design**: Architecture and layout inspired by PES (Pune Educational Society schools)
  - Long corridors
  - Classroom layouts
  - Laboratory rooms
  - Library
  - Assembly hall
  - Sports facilities
  - Staff rooms
  - Dark basement areas

### 3. Weapon System
- **Floor-Based Weapons**: Each floor has specific weapon spawns
  - **Ground Floor**: Basic melee weapons (pipes, bats, chairs)
  - **1st Floor**: Upgraded melee + basic ranged (slingshots, throwables)
  - **2nd Floor**: Mid-tier weapons (crossbows, flare guns)
  - **3rd Floor**: High-tier weapons (shotguns, rifles)
  - **Basement**: Rare/legendary weapons (flamethrower, holy water launcher)
- **Weapon Durability**: Weapons degrade with use
- **Ammo Management**: Ranged weapons require ammo found throughout the school

### 4. Lighting & Visibility System
- **Random Blackouts**: Power randomly cuts out, plunging areas into darkness
  - Frequency: Every 2-5 minutes
  - Duration: 30-90 seconds
  - Warning signs: Flickering lights before blackout
- **Torch/Flashlight**: 
  - Battery-powered (depletes over time)
  - Toggle on/off with 'F' key
  - Limited range and cone of vision
  - Batteries found throughout school
- **Headlights**: 
  - Alternative to torch (vehicle-mounted if players have karts/mobility items)
  - Brighter but attracts more ghouls

### 5. Ghoul System
- **Ghoul Types**:
  - **Wanderers**: Slow-moving, patrol corridors
  - **Stalkers**: Follow players from shadows, attack when lights go out
  - **Screamers**: Fast, loud, spawn during blackouts
  - **Boss Ghouls**: Appear at specific floors, require multiple players to defeat
- **AI Behavior**:
  - Attracted to light and noise
  - More aggressive during blackouts
  - Spawn in dark areas and during night progression
  - Can break down doors and barriers

### 6. Environmental Hazards
- Creaky floorboards that make noise
- Broken windows and debris
- Locked doors requiring keys
- Traps set by previous victims
- Unstable structures

## Player Mechanics

### Movement
- **WASD**: Movement
- **Shift**: Sprint (limited stamina)
- **Space**: Jump
- **Ctrl**: Crouch (quieter movement)

### Combat
- **Left Mouse**: Attack/Shoot
- **R**: Reload (ranged weapons)
- **1-5**: Weapon slots

### Interaction
- **E**: Interact (pick up items, open doors, use switches)
- **F**: Toggle torch/flashlight
- **Tab**: Inventory
- **M**: Map (revealed areas only)

### Survival
- **Stamina System**: Sprint and melee attacks consume stamina
- **Health**: Damaged by ghouls, can be healed with med kits
- **Sanity**: Prolonged darkness reduces sanity, causing visual/audio hallucinations

## Progression System

### Floor Progression
1. **Start**: All players spawn on Ground Floor
2. **Keys/Switches**: Each floor requires finding keys or activating switches to access next floor
3. **Risk/Reward**: Higher floors have better weapons but more dangerous ghouls

### Night Cycle
- **Dusk** (0-5 min): Few ghouls, lights mostly work
- **Evening** (5-10 min): More ghouls, frequent blackouts
- **Midnight** (10-15 min): Maximum ghoul spawns, extended blackouts
- **Dawn** (15-20 min): Ghouls retreat, survivors win

## Multiplayer Features

### Cooperation & Competition
- **Temporary Alliances**: Players can team up to fight boss ghouls
- **Resource Scarcity**: Limited weapons and ammo encourage competition
- **Voice Proximity**: In-game voice chat (proximity-based, ghouls can hear)
- **Player Trading**: Trade items and weapons

### Lobby System
- Host creates lobby (2-8 players)
- Customizable settings:
  - Game duration
  - Ghoul difficulty
  - Blackout frequency
  - Starting lives (3-10)

## Audio Design
- **Ambient Sounds**: Wind, creaking, distant footsteps
- **Ghoul Sounds**: Breathing, growling, screaming
- **Music**: Tension-building soundtrack, intensifies during encounters
- **Environmental**: Doors, glass breaking, generators humming

## Visual Style
- **Dark, Atmospheric**: Limited lighting, shadows emphasized
- **Realistic School**: Based on actual school architecture (PES-inspired)
- **Horror Elements**: Graffiti, bloodstains, abandoned items
- **Post-Processing**: Film grain, vignetting, desaturation during low sanity

## Technical Requirements

### Networking
- Peer-to-peer or dedicated server
- Sync player positions, health, lives
- Sync ghoul AI across clients
- Sync blackout events

### Performance
- Target: 60 FPS on mid-range hardware
- LOD system for distant areas
- Occlusion culling for rooms
- Dynamic lighting optimization

## Future Expansions
- More school locations (different schools, universities)
- Additional game modes (timed runs, horde mode, story mode)
- Cosmetic customization (skins, torch designs)
- Steam Workshop support for custom maps
- Seasonal events and limited-time weapons

## Development Priorities

### Phase 1 (MVP - Minimum Viable Product)
1. Basic player movement and controls
2. Single floor with simple layout
3. Basic ghoul AI (1 type)
4. Torch lighting system
5. Basic weapon (melee)
6. Lives system
7. Win/lose conditions

### Phase 2 (Core Features)
1. Multi-floor school building
2. Multiple weapon types
3. Blackout system
4. Multiple ghoul types
5. Local multiplayer support

### Phase 3 (Polish & Multiplayer)
1. Online multiplayer
2. Lobby system
3. Voice chat
4. Advanced AI behaviors
5. Sound design
6. Visual polish

### Phase 4 (Content & Balance)
1. Additional floors and areas
2. More weapons and items
3. Balancing gameplay
4. Bug fixes and optimization
5. Player feedback integration

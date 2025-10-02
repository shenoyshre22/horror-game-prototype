# Gameplay Mechanics - Horror School Survival

## Core Gameplay Loop

### Objective
Survive the night in an abandoned school while fending off ghoul attacks. Last player standing wins.

## Player Stats & Systems

### Lives System
- **Starting Lives**: 5 per player
- **Losing a Life**: 
  - Ghoul kills you (health reaches 0)
  - Environmental death (falling, traps)
- **Respawn**: 
  - After losing a life, respawn at last safe room checkpoint
  - Brief invulnerability period (3 seconds)
- **Elimination**: When all 5 lives are lost, player becomes spectator

### Health System
- **Max Health**: 100 HP
- **Damage Sources**:
  - Ghoul attacks (10-40 damage depending on type)
  - Environmental hazards (varies)
  - Fall damage (>3 meters)
- **Healing**:
  - Med kits: +50 HP (found throughout school)
  - First aid boxes: +25 HP
  - Safe rooms: Slow regeneration over time

### Stamina System
- **Max Stamina**: 100
- **Consumption**:
  - Sprinting: -2 per second
  - Melee attacks: -10 per swing
  - Jumping: -15 per jump
- **Regeneration**: +5 per second when not consuming
- **Empty Stamina**: Cannot sprint, attacks are slower

### Sanity System
- **Max Sanity**: 100
- **Depletion**:
  - Being in darkness: -1 per second
  - Near ghouls without light: -2 per second
  - Witnessing other players die: -15
- **Effects of Low Sanity** (<30):
  - Screen distortion
  - Audio hallucinations (footsteps, whispers)
  - False ghoul sightings
  - Reduced movement speed
- **Restoration**:
  - In lit areas: +2 per second
  - In safe rooms: +5 per second
  - Using calming items: +20-30

## Floor System

### Floor Layout
```
3rd Floor - Science Labs & Computer Rooms
    ↑ (Stairs/Elevator)
2nd Floor - Classrooms & Staff Rooms  
    ↑ (Stairs/Elevator)
1st Floor - Classrooms & Library
    ↑ (Stairs/Elevator)
Ground Floor - Main Hall, Cafeteria, Gym (SPAWN POINT)
    ↓ (Basement Access)
Basement - Storage, Boiler Room, Maintenance
```

### Floor Progression
- **Access Requirements**: Each floor requires finding:
  - Key cards (in lockers, on desks)
  - Power switches (to activate elevators)
  - Key items (to unlock stairwell doors)
- **Safe Rooms**: One per floor (marked with green light)
  - Cannot be entered by ghouls
  - Regenerate health and sanity
  - Contains weapon locker and ammo

## Weapon System

### Weapon Categories

#### Melee Weapons (No Ammo)
1. **Wooden Chair Leg** (Ground Floor)
   - Damage: 15
   - Attack Speed: Fast
   - Durability: 20 hits
   
2. **Metal Pipe** (Ground Floor)
   - Damage: 25
   - Attack Speed: Medium
   - Durability: 40 hits
   
3. **Fire Axe** (1st Floor)
   - Damage: 40
   - Attack Speed: Slow
   - Durability: 60 hits
   
4. **Chainsaw** (Basement - Rare)
   - Damage: 60 per second
   - Attack Speed: Continuous
   - Fuel: 30 seconds of use

#### Ranged Weapons (Require Ammo)
1. **Slingshot** (1st Floor)
   - Damage: 10 per rock
   - Ammo Capacity: 20 rocks
   - Range: Medium
   
2. **Crossbow** (2nd Floor)
   - Damage: 35 per bolt
   - Ammo Capacity: 15 bolts
   - Range: Long
   - Reload Time: Slow
   
3. **Flare Gun** (2nd Floor)
   - Damage: 20 (burns for 5 seconds)
   - Ammo Capacity: 6 flares
   - Range: Medium
   - Special: Creates light source, attracts distant ghouls
   
4. **Shotgun** (3rd Floor - Rare)
   - Damage: 80 (close range), 40 (medium range)
   - Ammo Capacity: 8 shells
   - Range: Short-Medium
   - Reload Time: Medium
   
5. **Holy Water Launcher** (Basement - Legendary)
   - Damage: 100 to ghouls (instant kill most types)
   - Ammo Capacity: 5 shots
   - Range: Short
   - Special: Bonus damage to all ghoul types

### Weapon Durability & Ammo
- **Melee Durability**: 
  - Degrades with each hit
  - Weapon breaks when durability reaches 0
  - Can be partially repaired at safe room workbenches
  
- **Ammo Scarcity**:
  - Limited ammo spawns per floor
  - Players compete for ammo
  - Some ghouls drop ammo when killed

## Lighting & Blackout System

### Normal Lighting
- Ceiling lights illuminate corridors and rooms
- Some lights are broken or flickering
- Shadows in corners and dark areas

### Torch/Flashlight
- **Battery Life**: 5 minutes of continuous use
- **Range**: 10 meters cone of light
- **Toggle**: Press 'F' to turn on/off
- **Battery Pickups**: Found in classrooms, staff rooms, janitor closets
- **Strategic Use**: Conserve battery for blackouts

### Headlights (Vehicle-Mounted)
- **Note**: If implementing kart/vehicle system
- **Battery Life**: 10 minutes
- **Range**: 15 meters wide cone
- **Drawback**: Attracts more ghouls
- **Usage**: Better for exploring large open areas (gym, halls)

### Blackout Events
- **Frequency**: Random, every 2-5 minutes
- **Warning**: Lights flicker 5 seconds before blackout
- **Duration**: 30-90 seconds
- **Effects**:
  - All ceiling lights turn off
  - Emergency lights provide minimal illumination
  - Ghoul spawn rate increases 3x
  - Ghouls move 25% faster
  - Player sanity depletes faster
- **Survival Strategy**:
  - Stay in lit areas (emergency lights, torch-lit rooms)
  - Move to safe rooms
  - Group with other players for safety

## Ghoul Types & Behaviors

### 1. Wanderer (Common)
- **HP**: 50
- **Damage**: 10 per attack
- **Speed**: Slow (70% of player run speed)
- **Behavior**: Patrols corridors, investigates sounds
- **Weakness**: Easily avoided, low HP
- **Spawn**: All floors, during all times

### 2. Stalker (Uncommon)
- **HP**: 75
- **Damage**: 20 per attack
- **Speed**: Medium (90% of player run speed)
- **Behavior**: Follows players from distance, attacks when player's back is turned
- **Special**: Invisible in darkness until very close
- **Weakness**: Torch light reveals them
- **Spawn**: Floors 1-3, more common during blackouts

### 3. Screamer (Uncommon)
- **HP**: 30
- **Damage**: 15 per attack
- **Speed**: Very Fast (120% of player run speed)
- **Behavior**: Spawns during blackouts, charges at nearest player
- **Special**: Emits loud scream when spotting player (alerts other ghouls)
- **Weakness**: Low HP, dies quickly
- **Spawn**: During blackouts only

### 4. Brute (Rare)
- **HP**: 200
- **Damage**: 40 per attack
- **Speed**: Slow (60% of player run speed)
- **Behavior**: Guards stairwells and key locations, smashes through doors
- **Special**: Can break barricades and destroy obstacles
- **Weakness**: Slow, predictable attacks
- **Spawn**: Floor 2, 3, and Basement

### 5. The Headmaster (Boss - Legendary)
- **HP**: 500
- **Damage**: 60 per attack
- **Speed**: Medium (80% of player run speed)
- **Behavior**: Hunts players methodically, calls other ghouls to assist
- **Special Abilities**:
  - Can trigger blackouts at will
  - Teleports between classrooms
  - Summons 3 Wanderers when HP < 50%
- **Weakness**: Vulnerable to holy water and fire
- **Spawn**: 3rd Floor principal's office (must be summoned by entering)

## Environmental Interactions

### Doors
- **Wooden Doors**: Can be opened/closed, broken by Brutes
- **Metal Doors**: Require keys, cannot be broken
- **Barricading**: Use items to block doors (chairs, desks)

### Windows
- **Breaking**: Can break to create shortcuts or escape routes
- **Noise**: Breaking glass attracts ghouls
- **Exiting**: Can jump through windows (may take fall damage)

### Lockers & Containers
- **Searching**: Press 'E' to search
- **Contents**: Ammo, batteries, med kits, key items
- **Noise**: Opening metal lockers creates noise

### Light Switches & Generators
- **Switches**: Can turn on/off lights in specific rooms
- **Generators**: Basement generators can prevent blackouts (need fuel)
- **Risk**: Operating generators creates loud noise

### Traps & Hazards
- **Tripwires**: Trigger noise alerts
- **Broken Floors**: Can fall through to lower floor
- **Chemical Spills**: Damage over time (labs)
- **Live Wires**: Damage and stun during blackouts

## Multiplayer Dynamics

### Player vs Player (Indirect)
- **No Direct PvP**: Players cannot directly damage each other
- **Resource Competition**: Fight over weapons, ammo, batteries
- **Trap Activation**: Players can activate traps that harm others
- **Ghoul Aggro**: Can lead ghouls to other players

### Cooperation Opportunities
- **Boss Fights**: Brutes and Headmaster easier with multiple players
- **Resource Sharing**: Drop and share items
- **Safe Room Defense**: Work together during blackouts
- **Revive System**: Can help downed players (costs time and risk)

## Win Conditions

### Victory
- **Last Player Standing**: Be the last player with lives remaining
- **Survival to Dawn**: If multiple players survive until 20-minute mark, tied victory

### Defeat
- **All Lives Lost**: Become spectator, watch remaining players
- **Can Rejoin**: Next round starts fresh

## Scoring System
- **Ghoul Kills**: +10 points each
- **Boss Kill**: +100 points
- **Survival Time**: +1 point per minute
- **Lives Remaining**: +50 points per life
- **Winning Bonus**: +200 points

## Tips & Strategies

### Early Game (0-5 minutes)
- Grab basic weapons quickly
- Collect batteries and med kits
- Learn floor layout
- Avoid confrontations

### Mid Game (5-15 minutes)
- Progress to higher floors for better weapons
- Manage resources carefully
- Watch for blackout warnings
- Form temporary alliances for boss fights

### Late Game (15-20 minutes)
- Secure safe room positions
- Conserve ammo and batteries
- Play defensively
- Watch for desperate players

### Blackout Survival
1. Get to lit area immediately
2. Activate torch before blackout
3. Move to safe room if nearby
4. Face walls to watch for stalkers
5. Stay mobile, don't camp in one spot

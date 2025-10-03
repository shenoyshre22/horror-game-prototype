# Horror School Survival 

A multiplayer survival horror game prototype inspired by SmashKarts and Short Creepy Stories (Roblox), set in an abandoned school. Players must survive ghoul attacks while collecting weapons across multiple floors in a PES-inspired school building.

##  Game Concept

**Genre**: Multiplayer Survival Horror  
**Platform**: PC (Godot Engine 4.2+)  
**Players**: 2-8 (Multiplayer)  
**Objective**: Be the last player standing by surviving ghoul attacks and managing your 5 lives

##  Key Features

###  Multi-Floor Abandoned School
- **PES-Inspired Architecture**: Realistic school layout based on Pune Educational Society schools
- **5 Distinct Floors**: Ground floor, 1st, 2nd, 3rd floors, and basement
- **Varied Environments**: Classrooms, laboratories, library, gymnasium, cafeteria, and dark basement areas

###  Progressive Weapon System
- **Floor-Based Weapon Tiers**: Better weapons on higher floors
  - **Ground Floor**: Basic melee (pipes, bats, chairs)
  - **1st Floor**: Upgraded melee + throwables
  - **2nd Floor**: Mid-tier ranged (crossbows, flare guns)
  - **3rd Floor**: High-tier firearms (shotguns)
  - **Basement**: Legendary weapons (holy water launcher, chainsaw)
- **Resource Management**: Limited ammo and weapon durability

###  Dynamic Lighting System
- **Random Blackouts**: Power cuts plunge areas into complete darkness
- **Torch/Flashlight**: Battery-powered personal lighting (toggle with 'F')
- **Battery Management**: Find batteries throughout the school
- **Strategic Lighting**: Light attracts ghouls but provides safety

###  Ghoul Enemy System
- **Multiple Ghoul Types**:
  - **Wanderers**: Slow patrol enemies
  - **Stalkers**: Invisible in darkness, ambush players
  - **Screamers**: Fast, spawn during blackouts
  - **Brutes**: Tank enemies guarding key areas
  - **The Headmaster**: Epic boss with special abilities
- **AI Behaviors**: Attracted to light and noise, more aggressive during blackouts

### 🎮 Core Mechanics
- **5 Lives Per Player**: Limited respawns, high stakes gameplay
- **Survival Systems**: Health, stamina, and sanity management
- **Night Cycle**: Game progresses from dusk to dawn (20 minutes)
- **Last Player Standing**: Win by outliving all other players

## 🕹️ Controls

| Action | Key/Button |
|--------|-----------|
| Move | W/A/S/D |
| Sprint | Shift |
| Jump | Space |
| Crouch | Ctrl |
| Attack/Shoot | Left Mouse |
| Reload | R |
| Interact | E |
| Toggle Torch | F |
| Inventory | Tab |
| Map | M |

## 📁 Project Structure

```
horror-game-prototype/
├── project.godot           # Godot project configuration
├── scenes/                 # Game scenes (.tscn files)
│   ├── MainMenu.tscn      # Main menu scene
│   ├── Lobby.tscn         # Multiplayer lobby
│   ├── GameLevel.tscn     # Main game level
│   └── ...
├── scripts/               # GDScript files
│   ├── GameManager.gd     # Core game logic
│   ├── NetworkManager.gd  # Multiplayer networking
│   ├── Player.gd          # Player controller
│   ├── Ghoul.gd          # Ghoul AI base class
│   └── ...
├── assets/               # Game assets
│   ├── models/          # 3D models
│   ├── textures/        # Textures and materials
│   ├── audio/           # Sound effects and music
│   └── ui/              # UI elements
├── GAME_DESIGN.md       # Complete game design document
├── GAMEPLAY.md          # Detailed gameplay mechanics
├── ROADMAP.md           # Development roadmap
└── README.md            # This file
```

## 🚀 Development Status

This is a prototype in early development. See [ROADMAP.md](ROADMAP.md) for planned features and development timeline.

### Current Phase: Planning & Documentation
- [x] Game design concept
- [x] Core mechanics documentation
- [x] Project structure setup
- [ ] Basic player controller
- [ ] Single floor prototype
- [ ] Basic ghoul AI
- [ ] Lighting system
- [ ] Weapon system
- [ ] Multiplayer implementation

## 📚 Documentation

- **[GAME_DESIGN.md](GAME_DESIGN.md)**: Complete game design document with detailed feature descriptions
- **[GAMEPLAY.md](GAMEPLAY.md)**: In-depth gameplay mechanics, systems, and strategies
- **[ROADMAP.md](ROADMAP.md)**: Development roadmap and implementation phases

## 🛠️ Technology Stack

- **Engine**: Godot 4.2+
- **Language**: GDScript
- **Networking**: Godot's built-in multiplayer API
- **3D Rendering**: Forward+ renderer
- **Platform**: Windows/Linux/macOS

## 🎯 Development Priorities

### Phase 1: MVP (Minimum Viable Product)
1. Basic player movement and controls
2. Single floor with simple layout
3. Basic ghoul AI (Wanderer type)
4. Torch lighting system
5. Basic melee weapon
6. Lives system and respawn
7. Win/lose conditions

### Phase 2: Core Features
1. Multi-floor school building
2. Multiple weapon types and tiers
3. Blackout system implementation
4. Multiple ghoul types with unique AI
5. Local multiplayer support

### Phase 3: Polish & Multiplayer
1. Online multiplayer with lobby system
2. Advanced AI behaviors
3. Audio design and sound effects
4. Visual polish and post-processing effects
5. UI/UX improvements

### Phase 4: Content & Balance
1. Additional floors and secret areas
2. More weapons and items
3. Gameplay balancing
4. Bug fixes and optimization
5. Community feedback integration

## 🤝 Contributing

This is a prototype project. Contributions, ideas, and feedback are welcome!

## 📄 License

This project is a prototype for educational and development purposes.

## 🎮 Inspiration

- **SmashKarts**: Multiplayer competition and fast-paced action
- **Short Creepy Stories (Roblox)**: Horror atmosphere and narrative elements
- **PES University**: Architectural inspiration for the school setting

## 📧 Contact

For questions or feedback about this project, please create an issue in the repository.

---

**Status**: 🚧 In Development - Prototype Phase  
**Engine**: Godot 4.2+  
**Last Updated**: 2024

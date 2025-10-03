# Quick Start Guide - Horror School Survival

## Prerequisites
- **Godot Engine 4.2 or later** - [Download here](https://godotengine.org/download)
- Basic understanding of Godot and GDScript (for development)

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/shenoyshre22/horror-game-prototype.git
cd horror-game-prototype
```

### 2. Open in Godot
1. Open Godot Engine
2. Click "Import"
3. Navigate to the cloned directory
4. Select `project.godot`
5. Click "Import & Edit"

## Current Project Status

⚠️ **This project is in early development (Phase 1: Planning & Documentation)**

### What's Implemented
- ✅ Project structure and configuration
- ✅ Core game manager system (GameManager.gd)
- ✅ Network manager system (NetworkManager.gd)
- ✅ Comprehensive game design documentation
- ✅ Development roadmap

### What's Not Yet Implemented
- ⏳ Player controller
- ⏳ Game levels/scenes
- ⏳ Ghoul AI
- ⏳ Weapon system
- ⏳ UI/HUD
- ⏳ Lighting and blackout system
- ⏳ Multiplayer functionality

## Development Setup

### Project Structure
```
horror-game-prototype/
├── project.godot        # Godot project file
├── scenes/              # Game scenes (empty - to be created)
├── scripts/             # GDScript files
│   ├── GameManager.gd   # Core game logic (implemented)
│   └── NetworkManager.gd # Networking (implemented)
├── assets/              # Game assets (empty - to be added)
└── docs/                # Documentation
```

### Key Configuration Files
- **project.godot**: Main project configuration with input mappings and autoloads
- **GameManager.gd**: Singleton for game state management
- **NetworkManager.gd**: Singleton for multiplayer networking

## Game Controls (Planned)

| Action | Key |
|--------|-----|
| Move Forward | W |
| Move Backward | S |
| Move Left | A |
| Move Right | D |
| Sprint | Shift |
| Jump | Space |
| Crouch | Ctrl |
| Shoot/Attack | Left Mouse |
| Reload | R |
| Interact | E |
| Toggle Torch | F |
| Inventory | Tab |
| Map | M |

## Next Development Steps

If you're contributing to development, here's what needs to be done next:

### 1. Player Controller (Priority 1)
- Create `scenes/Player.tscn`
- Implement `scripts/Player.gd` with:
  - Character movement (WASD)
  - Camera control (mouse look)
  - Sprint system with stamina
  - Health and lives system

### 2. Basic Level (Priority 2)
- Create `scenes/GameLevel.tscn`
- Design a simple single-floor school layout
- Add basic geometry and collision
- Set up navigation mesh for AI

### 3. Torch System (Priority 3)
- Implement flashlight/torch in `scripts/Torch.gd`
- Add battery system
- Create UI for battery indicator

### 4. Basic Ghoul (Priority 4)
- Create `scenes/Ghoul.tscn`
- Implement `scripts/Ghoul.gd` with:
  - Basic AI patrol behavior
  - Player detection
  - Chase and attack logic

## Documentation

Comprehensive documentation is available:

- **[README.md](README.md)**: Project overview and features
- **[GAME_DESIGN.md](GAME_DESIGN.md)**: Complete game design document
- **[GAMEPLAY.md](GAMEPLAY.md)**: Detailed gameplay mechanics and systems
- **[ROADMAP.md](ROADMAP.md)**: Development timeline and phases
- **[IMPLEMENTATION.md](IMPLEMENTATION.md)**: Technical implementation notes

## Testing

### Currently Available Tests
None yet - project is in documentation phase

### Planned Testing
- Unit tests for game systems (GameManager, NetworkManager)
- Integration tests for multiplayer
- Playtesting for balance

## Contributing

### Reporting Issues
- Use GitHub Issues to report bugs or suggest features
- Include reproduction steps for bugs
- Tag appropriately (bug, enhancement, documentation, etc.)

### Pull Requests
- Follow the development roadmap priorities
- Ensure code follows GDScript style guidelines
- Test your changes before submitting
- Update documentation if needed

### Code Style
- Use tabs for indentation (Godot default)
- Use snake_case for variables and functions
- Use PascalCase for class names
- Comment complex logic
- Keep functions small and focused

## Resources

### Learning Resources
- [Godot Documentation](https://docs.godotengine.org/)
- [GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
- [Godot Multiplayer Tutorial](https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html)

### Asset Resources (for future use)
- [Godot Asset Library](https://godotengine.org/asset-library/asset)
- [OpenGameArt](https://opengameart.org/)
- [Freesound](https://freesound.org/)
- [Mixamo](https://www.mixamo.com/) (for character animations)

## Troubleshooting

### Common Issues

#### "Project failed to load"
- Ensure you have Godot 4.2 or later
- Check that `project.godot` is in the root directory

#### "Autoload scripts not found"
- Ensure `GameManager.gd` is in `scripts/` folder
- Ensure `NetworkManager.gd` is in `scripts/` folder
- Restart Godot after creating the scripts

#### "Cannot run the game"
- Main scene not set yet (normal for current development stage)
- Will be fixed when scenes are created

## FAQ

**Q: Can I play the game right now?**  
A: No, the game is currently in the documentation and planning phase. There are no playable scenes yet.

**Q: When will the first playable version be ready?**  
A: According to the roadmap, the MVP (Phase 1) is estimated to take 4-6 weeks. Check ROADMAP.md for details.

**Q: Can I help with development?**  
A: Yes! Check the ROADMAP.md for current priorities and create a pull request with your contributions.

**Q: What engine version should I use?**  
A: Godot 4.2 or later. The project uses Godot 4.x features.

**Q: Will there be single-player mode?**  
A: Yes, the MVP focuses on single-player. Multiplayer will be added in Phase 2-3.

**Q: What platforms will be supported?**  
A: Initially PC (Windows, Linux, macOS). Console/mobile ports may come later.

## Contact

For questions, suggestions, or collaboration inquiries:
- Create an issue on GitHub
- Check existing documentation first
- Be specific and provide context

---

**Project Status**: 🚧 In Development - Documentation Phase  
**Last Updated**: 2024  
**Next Milestone**: Phase 1 MVP - Player Controller Implementation

# Contributing to Horror School Survival

Thank you for your interest in contributing to Horror School Survival! This document provides guidelines for contributing to the project.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Development Workflow](#development-workflow)
3. [Code Standards](#code-standards)
4. [Project Structure](#project-structure)
5. [Testing Guidelines](#testing-guidelines)
6. [Submitting Changes](#submitting-changes)

## Getting Started

### Prerequisites
- **Godot Engine 4.2+** - [Download](https://godotengine.org/download)
- **Git** - For version control
- Basic knowledge of GDScript and Godot
- Familiarity with 3D game development concepts

### Setting Up Your Development Environment

1. **Fork the repository**
   ```bash
   # Fork via GitHub UI, then clone your fork
   git clone https://github.com/YOUR_USERNAME/horror-game-prototype.git
   cd horror-game-prototype
   ```

2. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/shenoyshre22/horror-game-prototype.git
   ```

3. **Open in Godot**
   - Launch Godot Engine
   - Import the `project.godot` file
   - Wait for initial import to complete

4. **Check Documentation**
   - Read [README.md](README.md) for project overview
   - Review [ROADMAP.md](ROADMAP.md) for current priorities
   - Check [IMPLEMENTATION.md](IMPLEMENTATION.md) for technical details

## Development Workflow

### 1. Choose a Task

#### Current Priorities (Phase 1 - MVP)
- [ ] Player Controller implementation
- [ ] Basic level design (single floor)
- [ ] Torch/flashlight system
- [ ] Basic ghoul AI (Wanderer type)
- [ ] Weapon system (melee)
- [ ] UI/HUD components
- [ ] Win/lose conditions

Check [ROADMAP.md](ROADMAP.md) for detailed task breakdown.

### 2. Create a Branch

```bash
# Update your fork
git fetch upstream
git checkout main
git merge upstream/main

# Create feature branch
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

### 3. Implement Your Changes

Follow these principles:
- **Small, focused changes** - One feature or fix per branch
- **Frequent commits** - Commit logical units of work
- **Test as you go** - Verify changes work before committing
- **Update documentation** - If your changes affect usage

### 4. Test Your Changes

```bash
# Run the game in Godot
# Test all affected features
# Check for console errors
# Verify no performance regressions
```

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat: Add player movement controller

- Implement WASD movement
- Add mouse look camera control
- Create sprint system with stamina
- Add collision detection"
```

**Commit Message Format:**
```
<type>: <short description>

<detailed description>
<what changed>
<why it changed>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style/formatting
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

## Code Standards

### GDScript Style Guide

#### Naming Conventions
```gdscript
# Classes: PascalCase
class_name PlayerController

# Variables: snake_case
var player_health: float = 100.0
var is_alive: bool = true

# Constants: UPPER_SNAKE_CASE
const MAX_HEALTH: float = 100.0
const MOVEMENT_SPEED: float = 5.0

# Functions: snake_case
func calculate_damage(base_damage: float) -> float:
    return base_damage * damage_multiplier

# Private functions: _snake_case
func _update_health(delta: float) -> void:
    health += regeneration_rate * delta

# Signals: snake_case
signal health_changed(new_health: float)
signal player_died()
```

#### Code Formatting
```gdscript
# Indentation: Use tabs (Godot default)
func example_function():
	if condition:
		do_something()
	else:
		do_something_else()

# Spaces around operators
var result = a + b * c
var is_valid = x > 0 and y < 100

# Type hints (strongly encouraged)
var health: float = 100.0
func get_damage() -> float:
	return base_damage

# Comments for complex logic
# Calculate exponential decay over time
var decay = initial_value * exp(-decay_rate * time)
```

#### Code Organization
```gdscript
# 1. Class definition
class_name ClassName
extends ParentClass

# 2. Signals
signal signal_name(param: Type)

# 3. Enums
enum State { IDLE, WALKING, RUNNING }

# 4. Constants
const MAX_VALUE: int = 100

# 5. Exported variables
@export var speed: float = 5.0
@export var health: float = 100.0

# 6. Public variables
var current_state: State = State.IDLE

# 7. Private variables
var _internal_timer: float = 0.0

# 8. Onready variables
@onready var animator: AnimationPlayer = $AnimationPlayer

# 9. Lifecycle methods
func _ready():
	pass

func _process(delta: float):
	pass

# 10. Public methods
func public_method():
	pass

# 11. Private methods
func _private_method():
	pass

# 12. Signal handlers
func _on_signal_received():
	pass
```

### Scene Structure

#### Naming Conventions
- **Scenes**: PascalCase (e.g., `Player.tscn`, `MainMenu.tscn`)
- **Nodes**: PascalCase (e.g., `CollisionShape3D`, `AnimationPlayer`)
- **Node Groups**: lowercase (e.g., `players`, `enemies`)

#### Organization
```
Player.tscn
├── Player (CharacterBody3D) [Root]
│   ├── CollisionShape3D
│   ├── MeshInstance3D
│   ├── Camera3D
│   │   └── Torch (SpotLight3D)
│   ├── WeaponHolder (Node3D)
│   └── AnimationPlayer
```

### File Organization

```
scenes/
├── main/           # Main game scenes
├── ui/             # UI screens and HUD
├── characters/     # Player and NPC scenes
├── enemies/        # Enemy scenes
├── weapons/        # Weapon scenes
└── props/          # Interactive objects

scripts/
├── core/           # Core systems (managers, autoloads)
├── characters/     # Character controllers
├── ai/             # AI behaviors
├── weapons/        # Weapon scripts
└── ui/             # UI controllers
```

## Project Structure

### Core Components

#### GameManager (Singleton)
- Manages game state
- Tracks players and scores
- Handles win/lose conditions
- DO NOT modify without discussion

#### NetworkManager (Singleton)
- Handles multiplayer
- Server/client communication
- Player synchronization
- DO NOT modify without discussion

### Adding New Features

#### Creating a New Character
1. Create scene: `scenes/characters/NewCharacter.tscn`
2. Create script: `scripts/characters/NewCharacter.gd`
3. Extend appropriate base class
4. Add to documentation

#### Creating a New Weapon
1. Create scene: `scenes/weapons/WeaponName.tscn`
2. Create script: `scripts/weapons/WeaponName.gd`
3. Extend `Weapon` base class
4. Add stats to documentation

#### Creating a New Ghoul Type
1. Create scene: `scenes/enemies/GhoulType.tscn`
2. Create script: `scripts/ai/GhoulType.gd`
3. Extend `Ghoul` base class
4. Implement required AI states
5. Add to spawn system

## Testing Guidelines

### Manual Testing Checklist
- [ ] Game runs without errors
- [ ] No console warnings
- [ ] Feature works as expected
- [ ] No performance degradation
- [ ] Multiplayer sync (if applicable)
- [ ] Edge cases handled
- [ ] Documentation updated

### Performance Testing
- Target: 60 FPS on mid-range hardware
- Profile with Godot profiler
- Check memory usage
- Optimize before submitting

### Multiplayer Testing (when applicable)
- Test with 2+ clients
- Check synchronization
- Test with artificial latency
- Handle disconnections gracefully

## Submitting Changes

### Before Submitting

1. **Update your branch**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Test thoroughly**
   - Run the game
   - Check for errors
   - Verify functionality

3. **Update documentation**
   - Update README if needed
   - Add comments to code
   - Update relevant .md files

### Creating a Pull Request

1. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create PR on GitHub**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your fork and branch
   - Fill in the PR template

3. **PR Description Template**
   ```markdown
   ## Description
   Brief description of changes
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Documentation update
   - [ ] Refactoring
   
   ## Testing
   How was this tested?
   
   ## Screenshots (if applicable)
   
   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Documentation updated
   - [ ] Tested thoroughly
   - [ ] No breaking changes
   ```

### PR Review Process

1. **Automated checks** (if set up)
   - Code style
   - Build success

2. **Code review**
   - Maintainer reviews code
   - Feedback provided
   - Requested changes

3. **Approval and merge**
   - Approved by maintainer
   - Merged to main branch
   - Branch deleted

## Communication

### Reporting Bugs

**Use GitHub Issues** with this template:
```markdown
**Bug Description**
Clear description of the bug

**Steps to Reproduce**
1. Step one
2. Step two
3. ...

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- Godot Version: 4.x
- OS: Windows/Linux/macOS
- Hardware: GPU, RAM

**Screenshots/Logs**
If applicable
```

### Suggesting Features

**Use GitHub Issues** with this template:
```markdown
**Feature Description**
What feature do you want?

**Problem to Solve**
What problem does this solve?

**Proposed Solution**
How would you implement this?

**Alternatives Considered**
Other approaches?

**Additional Context**
Related features, mockups, etc.
```

### Getting Help

- Check [QUICKSTART.md](QUICKSTART.md)
- Review [IMPLEMENTATION.md](IMPLEMENTATION.md)
- Search existing issues
- Create new issue with "question" label
- Be specific and provide context

## Development Tips

### Performance
- Use object pooling for frequently spawned objects
- Optimize mesh polygon counts
- Use LOD for distant objects
- Profile regularly

### Networking
- Minimize RPC calls
- Use unreliable RPCs for position updates
- Use reliable RPCs for important events
- Test with latency

### AI
- Keep pathfinding simple
- Update AI at lower frequency
- Disable AI for distant enemies
- Use navigation mesh baking

### Assets
- Keep texture sizes reasonable (512x512, 1024x1024)
- Use compressed formats
- Optimize mesh triangles
- Use atlases for UI

## Recognition

Contributors will be:
- Listed in credits
- Mentioned in release notes
- Acknowledged in README

## Questions?

- Create an issue with "question" label
- Check existing documentation
- Provide context and examples

---

**Thank you for contributing to Horror School Survival!** 🎮👻

Together we're building something awesome. Every contribution matters, whether it's code, documentation, bug reports, or feedback.

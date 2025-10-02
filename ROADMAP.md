# Development Roadmap - Horror School Survival

## Project Vision
Create a multiplayer survival horror game set in an abandoned school where players compete to be the last one standing while surviving ghoul attacks, managing limited resources, and navigating through darkness during random blackouts.

## Development Phases

---

## Phase 1: MVP - Minimum Viable Product ⏱️ 4-6 weeks

**Goal**: Create a playable single-player prototype with core mechanics

### 1.1 Project Setup (Week 1)
- [x] Initialize Godot project
- [x] Create project structure (folders for scenes, scripts, assets)
- [x] Set up version control and .gitignore
- [x] Write game design documentation
- [ ] Set up basic scene hierarchy
- [ ] Configure project settings (input maps, display, rendering)

### 1.2 Player Controller (Week 1-2)
- [ ] Create player character node (CharacterBody3D)
- [ ] Implement WASD movement
- [ ] Add mouse look/camera control
- [ ] Implement sprint system with stamina
- [ ] Add jump and crouch mechanics
- [ ] Create player health system
- [ ] Implement lives system (5 lives)
- [ ] Add respawn functionality

### 1.3 Basic Environment (Week 2)
- [ ] Design simple single-floor school layout
  - [ ] Main corridor
  - [ ] 4-6 classrooms
  - [ ] One central hall
- [ ] Create basic 3D geometry (ProtoTools or CSG)
- [ ] Add collision meshes
- [ ] Set up lighting (basic ambient + point lights)
- [ ] Add simple props (desks, chairs, doors)

### 1.4 Lighting System (Week 2-3)
- [ ] Implement torch/flashlight system
  - [ ] Attach SpotLight3D to player camera
  - [ ] Toggle on/off with 'F' key
  - [ ] Add battery drain mechanic
  - [ ] Create battery UI indicator
- [ ] Add battery pickup items
- [ ] Create lighting shader effects

### 1.5 Basic Weapon System (Week 3)
- [ ] Create weapon base class (Resource/Script)
- [ ] Implement melee weapon (pipe)
  - [ ] Weapon pickup
  - [ ] Attack animation/raycast
  - [ ] Damage dealing
  - [ ] Durability system
- [ ] Add weapon UI (current weapon, durability)
- [ ] Create weapon switching system

### 1.6 Basic Ghoul AI (Week 3-4)
- [ ] Create Wanderer ghoul (CharacterBody3D)
- [ ] Implement basic AI navigation (NavigationAgent3D)
- [ ] Add patrol behavior
- [ ] Implement player detection (vision cone)
- [ ] Add chase behavior
- [ ] Implement attack behavior
- [ ] Add ghoul health and death
- [ ] Create simple ghoul model/placeholder

### 1.7 Core Game Loop (Week 4)
- [ ] Implement game state manager
  - [ ] Main menu state
  - [ ] Playing state
  - [ ] Game over state
- [ ] Add win/lose conditions
- [ ] Create simple UI
  - [ ] Health bar
  - [ ] Lives counter
  - [ ] Weapon display
  - [ ] Battery indicator
- [ ] Add pause menu
- [ ] Implement basic scoring system

### 1.8 Testing & Polish (Week 5-6)
- [ ] Playtest core mechanics
- [ ] Balance player vs ghoul difficulty
- [ ] Fix bugs and crashes
- [ ] Optimize performance
- [ ] Add basic sound effects
- [ ] Create simple background music

**Milestone 1 Complete**: Playable single-player prototype with one floor, basic combat, and ghoul AI

---

## Phase 2: Core Features ⏱️ 6-8 weeks

**Goal**: Expand game with multi-floor system, more content, and local multiplayer

### 2.1 Multi-Floor School Building (Week 7-8)
- [ ] Design full school layout
  - [ ] Ground floor (spawn area)
  - [ ] 1st floor
  - [ ] 2nd floor
  - [ ] 3rd floor
  - [ ] Basement
- [ ] Create stairwells and elevators
- [ ] Implement floor transition system
- [ ] Add locked doors requiring keys
- [ ] Create safe rooms (one per floor)
- [ ] Place weapon spawns by floor tier

### 2.2 Expanded Weapon System (Week 8-9)
- [ ] Add more melee weapons
  - [ ] Chair leg
  - [ ] Fire axe
  - [ ] Chainsaw (basement)
- [ ] Implement ranged weapons
  - [ ] Slingshot
  - [ ] Crossbow
  - [ ] Flare gun
  - [ ] Shotgun
  - [ ] Holy water launcher
- [ ] Create ammo system
- [ ] Add weapon pickup/drop
- [ ] Implement weapon durability UI
- [ ] Balance weapon damage and spawn rates

### 2.3 Additional Ghoul Types (Week 9-10)
- [ ] Create Stalker ghoul
  - [ ] Stealth behavior
  - [ ] Darkness invisibility
  - [ ] Ambush attacks
- [ ] Create Screamer ghoul
  - [ ] Fast movement
  - [ ] Spawn during blackouts
  - [ ] Alert scream ability
- [ ] Create Brute ghoul
  - [ ] High HP tank enemy
  - [ ] Door-breaking ability
  - [ ] Guard key locations
- [ ] Improve AI pathfinding
- [ ] Add varied ghoul sounds

### 2.4 Blackout System (Week 10-11)
- [ ] Implement random power outage system
- [ ] Add warning indicators (flickering lights)
- [ ] Create emergency lighting
- [ ] Increase ghoul spawn during blackouts
- [ ] Add blackout timer/duration system
- [ ] Create tension-building effects
- [ ] Add generator repair mechanic (optional)

### 2.5 Advanced Player Systems (Week 11-12)
- [ ] Implement stamina system
  - [ ] Sprint consumption
  - [ ] Melee attack cost
  - [ ] Regeneration
  - [ ] UI indicator
- [ ] Add sanity system
  - [ ] Darkness effect
  - [ ] Low sanity hallucinations
  - [ ] Visual/audio effects
  - [ ] UI indicator
- [ ] Create inventory system
- [ ] Add item pickups (med kits, batteries, ammo)
- [ ] Implement interaction system (doors, lockers, switches)

### 2.6 Local Multiplayer (Week 12-13)
- [ ] Set up split-screen system
- [ ] Implement player 2 controls
- [ ] Sync game state for both players
- [ ] Add player names/indicators
- [ ] Test and balance for 2+ players
- [ ] Create lobby/player selection screen

### 2.7 Environmental Interactions (Week 13-14)
- [ ] Add interactive doors
- [ ] Implement barricading system
- [ ] Add breakable windows
- [ ] Create searchable lockers
- [ ] Add light switches
- [ ] Implement environmental hazards
- [ ] Add key items and collectibles

**Milestone 2 Complete**: Multi-floor game with variety of weapons, ghouls, and local multiplayer

---

## Phase 3: Online Multiplayer & Polish ⏱️ 6-8 weeks

**Goal**: Add online multiplayer, polish gameplay, improve audio/visuals

### 3.1 Online Multiplayer Foundation (Week 15-16)
- [ ] Set up Godot multiplayer API
- [ ] Implement client-server architecture
- [ ] Create connection system
- [ ] Add player synchronization
- [ ] Sync ghoul AI across network
- [ ] Test with multiple clients

### 3.2 Lobby System (Week 16-17)
- [ ] Create lobby UI
- [ ] Implement host/join functionality
- [ ] Add player list display
- [ ] Create game settings customization
  - [ ] Player count
  - [ ] Game duration
  - [ ] Difficulty settings
  - [ ] Blackout frequency
  - [ ] Starting lives
- [ ] Add ready system
- [ ] Implement match start countdown

### 3.3 Voice Chat (Week 17-18)
- [ ] Integrate voice chat system
- [ ] Implement proximity-based voice
- [ ] Add push-to-talk option
- [ ] Create voice settings (volume, mute)
- [ ] Test voice quality and latency

### 3.4 Advanced AI Behaviors (Week 18-19)
- [ ] Improve pathfinding intelligence
- [ ] Add group coordination for ghouls
- [ ] Implement sound-based detection
- [ ] Create dynamic difficulty scaling
- [ ] Add boss ghoul (The Headmaster)
  - [ ] Unique model/animations
  - [ ] Special abilities
  - [ ] Multi-phase fight
  - [ ] Summon minions

### 3.5 Audio Design (Week 19-20)
- [ ] Record/source ambient sounds
  - [ ] Wind
  - [ ] Creaking
  - [ ] Distant footsteps
  - [ ] School bell
- [ ] Add ghoul sound effects
  - [ ] Breathing
  - [ ] Growling
  - [ ] Attack sounds
  - [ ] Death sounds
- [ ] Create music tracks
  - [ ] Menu theme
  - [ ] Ambient exploration
  - [ ] Combat intensity
  - [ ] Boss battle
- [ ] Implement 3D spatial audio
- [ ] Add dynamic music system

### 3.6 Visual Polish (Week 20-21)
- [ ] Improve school environment art
- [ ] Add PES-inspired architectural details
- [ ] Create custom textures
- [ ] Add particle effects
  - [ ] Dust motes
  - [ ] Sparks during blackout
  - [ ] Blood effects
  - [ ] Torch glow
- [ ] Implement post-processing
  - [ ] Film grain
  - [ ] Vignetting
  - [ ] Chromatic aberration
  - [ ] Sanity effects
- [ ] Add weather effects (rain on windows)
- [ ] Create character models/animations

### 3.7 UI/UX Improvements (Week 21-22)
- [ ] Redesign main menu
- [ ] Create modern HUD
- [ ] Add minimap system
- [ ] Implement death cam/spectator mode
- [ ] Add kill feed
- [ ] Create end-game statistics screen
- [ ] Add settings menu
  - [ ] Graphics options
  - [ ] Audio options
  - [ ] Controls customization
- [ ] Implement tutorial system

**Milestone 3 Complete**: Full multiplayer game with polished audio/visuals

---

## Phase 4: Content & Balance ⏱️ 4-6 weeks

**Goal**: Add more content, balance gameplay, optimize performance

### 4.1 Additional Content (Week 23-24)
- [ ] Add more school areas
  - [ ] Science labs
  - [ ] Art room
  - [ ] Music room
  - [ ] Auditorium
  - [ ] Rooftop access
- [ ] Create secret areas
- [ ] Add more weapon variants
- [ ] Implement cosmetic items
- [ ] Create achievements system

### 4.2 Gameplay Balancing (Week 24-25)
- [ ] Balance weapon damage/durability
- [ ] Adjust ghoul difficulty
- [ ] Fine-tune resource spawn rates
- [ ] Balance player stats (health, stamina, sanity)
- [ ] Adjust blackout timing
- [ ] Test and iterate on game duration
- [ ] Balance multiplayer fairness

### 4.3 Optimization (Week 25-26)
- [ ] Profile performance
- [ ] Optimize 3D models (LOD system)
- [ ] Improve lighting performance
- [ ] Optimize AI pathfinding
- [ ] Reduce network bandwidth
- [ ] Fix memory leaks
- [ ] Target 60 FPS on mid-range hardware

### 4.4 Bug Fixes & QA (Week 26-27)
- [ ] Set up bug tracking system
- [ ] Conduct playtesting sessions
- [ ] Fix critical bugs
- [ ] Fix gameplay exploits
- [ ] Test edge cases
- [ ] Improve error handling
- [ ] Add crash reporting

### 4.5 Community Feedback (Week 27-28)
- [ ] Release public beta
- [ ] Gather player feedback
- [ ] Implement requested features
- [ ] Balance based on player data
- [ ] Create feedback survey
- [ ] Monitor community discussions

**Milestone 4 Complete**: Polished, balanced game ready for release

---

## Future Expansions (Post-Launch)

### Content Updates
- [ ] New school locations
- [ ] Seasonal events
- [ ] Limited-time game modes
- [ ] New ghoul types
- [ ] New weapons and items
- [ ] Cosmetic DLC

### Game Modes
- [ ] Horde mode (endless waves)
- [ ] Story mode (single-player campaign)
- [ ] Time trial mode
- [ ] Custom game modes
- [ ] Tournament mode

### Features
- [ ] Steam Workshop support
- [ ] Custom map editor
- [ ] Mod support
- [ ] Replay system
- [ ] Spectator mode improvements
- [ ] Clan/team systems
- [ ] Ranked matchmaking

### Technical Improvements
- [ ] Dedicated server support
- [ ] Cross-platform play
- [ ] Console ports
- [ ] Mobile companion app
- [ ] Integration with streaming platforms

---

## Development Guidelines

### Version Control
- Use feature branches for major features
- Commit frequently with clear messages
- Tag releases with version numbers
- Maintain changelog

### Testing Strategy
- Unit tests for core systems
- Integration tests for multiplayer
- Regular playtesting sessions
- Performance benchmarking
- Automated testing where possible

### Documentation
- Keep design docs updated
- Document code with comments
- Maintain API documentation
- Create developer guides
- Write player guides/tutorials

### Performance Targets
- **FPS**: 60 FPS minimum on mid-range hardware
- **Network Latency**: <100ms for smooth gameplay
- **Load Times**: <10 seconds for level loading
- **Memory**: <4GB RAM usage

### Code Quality
- Follow GDScript style guide
- Use consistent naming conventions
- Refactor regularly
- Code reviews for major changes
- Maintain clean architecture

---

## Risk Management

### Technical Risks
- **Multiplayer Networking**: Complex to implement and debug
  - Mitigation: Start with local multiplayer, thoroughly test
- **Performance**: 3D game with multiple players and AI
  - Mitigation: Profile early, optimize continuously
- **AI Pathfinding**: Can be CPU-intensive
  - Mitigation: Use Godot's NavigationServer, limit active AI

### Design Risks
- **Gameplay Balance**: Difficult to balance PvE + competitive elements
  - Mitigation: Extensive playtesting, iterative balancing
- **Player Retention**: Horror games can be repetitive
  - Mitigation: Varied content, random elements, multiple strategies

### Project Risks
- **Scope Creep**: Feature requests can expand scope
  - Mitigation: Stick to roadmap, prioritize MVP features
- **Time Management**: Development may take longer than estimated
  - Mitigation: Regular milestone reviews, cut features if needed

---

## Success Metrics

### Phase 1 (MVP)
- ✅ Playable single-player prototype
- ✅ Core loop is fun and engaging
- ✅ No critical bugs

### Phase 2 (Core Features)
- ✅ 2-4 players can play together locally
- ✅ Multiple weapon and ghoul types
- ✅ Blackout system adds tension

### Phase 3 (Multiplayer & Polish)
- ✅ 2-8 players can play online
- ✅ Lobby system functional
- ✅ Audio and visuals are polished

### Phase 4 (Release Ready)
- ✅ Balanced gameplay
- ✅ Stable performance (60 FPS)
- ✅ Positive player feedback
- ✅ Ready for public release

---

## Timeline Summary

| Phase | Duration | Cumulative |
|-------|----------|------------|
| Phase 1: MVP | 4-6 weeks | 6 weeks |
| Phase 2: Core Features | 6-8 weeks | 14 weeks |
| Phase 3: Multiplayer & Polish | 6-8 weeks | 22 weeks |
| Phase 4: Content & Balance | 4-6 weeks | 28 weeks |
| **Total** | **20-28 weeks** | **~6-7 months** |

*Note: Timeline is estimated for a single developer working part-time. Adjust based on team size and availability.*

---

## Current Status

**Phase**: Phase 1 - Project Setup  
**Progress**: 20% (Documentation complete, starting implementation)  
**Next Steps**: Complete player controller and basic environment  
**Last Updated**: 2024
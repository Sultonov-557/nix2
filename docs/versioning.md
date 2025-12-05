# Versioning Guide

Nixul follows [Semantic Versioning 2.0.0](https://semver.org/).

## Version Format

`vMAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes (e.g., major refactor of module system)
- **MINOR**: New features (e.g., new Flavor, new global module)
- **PATCH**: Bug fixes and minor tweaks

## Creating a Release

### 1. Update Version

Update version references in:
- `BRANDING_AND_ROADMAP.md` (roadmap milestones)
- Any version-specific documentation

### 2. Update CHANGELOG

Create or update `CHANGELOG.md` with:
```markdown
## [vX.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes to existing functionality

### Fixed
- Bug fixes
```

### 3. Commit Changes

```bash
git add .
git commit -m "chore: prepare release vX.Y.Z"
git push
```

### 4. Create Tag

```bash
git tag -a vX.Y.Z -m "Release vX.Y.Z"
git push origin vX.Y.Z
```

### 5. Automated Build

GitHub Actions will automatically:
1. Build the ISO
2. Create a GitHub release
3. Attach the ISO as a release asset

## Version History

### v0.1.0 - Foundation
- Initial repository structure
- Core catppuccin and macos flavors
- Basic documentation

### v0.2.0 - Community & Polish (In Progress)
- ✅ Automated ISO builds
- ✅ Automated flake checks
- Community flavor submissions
- Flavor switching tool

### v1.0.0 - Official Release (Planned)
- Stable, well-tested core
- 10+ official Flavors
- Dedicated project website
- Graphical installer integration

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v0.1.3] - 2026-01-26

### Added
- Advanced content flagging capability with `advanced-content()` wrapper
- `set-show-advanced()` function to control visibility of advanced content
- Support for filtering advanced content from core teaching materials

### Changed
- Updated `typst.toml` to version 0.1.3
- Updated changelog to reflect version changes

## [v0.1.2] - 2026-01-25

### Added
- `slide-break()` function for explicit slide breaks in presentations
- `page-break()` function for explicit page breaks in documents
- Claude Skills documentation (`claude.md`)
- Skill file to guide upgrading of Typst modules

### Fixed
- Fixed center issue (renamed `center` to `centred` to avoid conflicts with Typst core language)
- Fixed center shadow bug in presentation formatting

### Changed
- Updated `typst.toml` to reflect latest version

## [v0.1.1] - 2026-01-25

### Changed
- Updated document formatting
- Updated README to include devcontainer JSON example

### Removed
- Removed devcontainer configuration from repository

## [v0.1.0] - 2025-12-26

### Added
- Initial release of typst-dual-format 
  - taken from github.com/jasonyan-s/FINMA_Content_Management_System_Demo
  - includes some adjustments as noted in the `Fixed` section below
- Core dual format functionality for creating both documents and presentations from single source
- `dual_format.typ` - Main module for dual format support
- `document_functions.typ` - Document-specific functions
- `presentation_functions.typ` - Presentation-specific functions
- `typst.toml` - Package manifest file
- LICENSE file (MIT License)
- Installation instructions in README
- Corporate finance example demonstrating optimal capital structure
  - Example content files
  - Example document and slides outputs
  - Example images and logos
- Modular example structure with reusable content modules:
  - Arbitrage proof concepts
  - Capital structure without taxes
  - Leverage effects
  - Modigliani-Miller irrelevance propositions
- Devcontainer configuration for Typst development
- System explanation documentation (`Typst_system_explanation.typ`)

### Fixed
- Subtext formatting in dual_format module
- Indentation and lorem ipsum details in examples

### Documentation
- Comprehensive README with usage instructions
- Installation guide
- Example usage demonstrations

[v0.1.3]: https://github.com/howesrichard/typst-dual-format/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/howesrichard/typst-dual-format/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/howesrichard/typst-dual-format/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/howesrichard/typst-dual-format/releases/tag/v0.1.0

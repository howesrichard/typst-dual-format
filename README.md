# Typst Dual-Format System

A sophisticated content management system for course materials that enables you to **write once, render twice**—automatically generating both presentation slides and study guide documents from a single source.

## Overview

This system eliminates content duplication in educational materials by using Typst's powerful typesetting capabilities to intelligently format content for two distinct outputs:

- **Presentation Slides** (16:9 format for lectures)
- **Study Guide Documents** (A4 format for student reference)

## Key Features

- 📝 **Single Source Content** - Write your content once in Typst format
- 🎯 **Intelligent Rendering** - Content automatically adapts based on output format
- 🔄 **Conditional Display** - Control what appears in presentations vs. documents
- 📊 **Advanced Filtering** - Show/hide complex content for different audience levels
- 🎨 **Consistent Styling** - Unified visual language across all materials
- 🛠️ **Easy Maintenance** - Updates propagate automatically to both formats

## Installation

This package is designed to be used as a Git submodule in your course content repositories.

### Adding to Your Course Repository

1. **Add as a submodule** in your course repository:
   ```bash
   git submodule add https://github.com/howesrichard/typst-dual-format.git utility
   ```

2. **Initialize and update** (for first-time setup):
   ```bash
   git submodule init
   git submodule update
   ```

3. **Clone a repository with submodules** (for team members):
   ```bash
   git clone --recurse-submodules <your-course-repo-url>
   ```

   Or if already cloned without submodules:
   ```bash
   git submodule update --init --recursive
   ```

### Updating to Latest Version

To update the dual-format system in your course repository:

```bash
cd utility
git pull origin main
cd ..
git add utility
git commit -m "Update dual-format system to latest version"
```

## Quick Start

### File Structure

```
utility/
├── dual_format.typ           # Core logic and mode switching
├── document_functions.typ    # Document-specific functions
└── presentation_functions.typ # Presentation-specific functions

Week_X_Topic/
├── Week_X_Topic_content.typ   # Single source content file
├── Week_X_Topic_document.typ  # Document driver (imports content)
└── Week_X_Topic_slides.typ    # Presentation driver (imports content)
```

### Basic Usage

1. **Write your content** in a `*_content.typ` file using the dual-format functions
2. **Create driver files** for document and presentation outputs
3. **Compile** each driver file to generate both formats

Example content file:
```typst
#import "../utility/dual_format.typ": *

#section("Introduction")

#content-block(
  title: "Key Concept",
  summary: [Brief overview for slides],
  content: [Detailed explanation for documents],
  examples: [Worked examples],
  notes: [Additional notes for documents only]
)
```

## Documentation

For comprehensive documentation including:
- Complete system architecture with visual diagrams
- Detailed function reference
- Advanced usage patterns
- Best practices

**See: [Typst_system_explanation.typ](Typst_system_explanation.typ)**

Compile this file to PDF for a fully formatted manual with system diagrams:
```bash
typst compile Typst_system_explanation.typ
```

## Requirements

- [Typst](https://typst.app/) installed (or use the web app)

## Use Case

Originally developed for the FINMA derivatives course content management system, this architecture is suitable for any educational content that needs to be presented in multiple formats while maintaining consistency and reducing maintenance overhead.

## License

Proprietary - Copyright (c) 2025 Financial Markets Academy (FINMA). All rights reserved.

This software is licensed for internal use only by authorized FINMA employees. See [LICENSE](LICENSE) for full terms.
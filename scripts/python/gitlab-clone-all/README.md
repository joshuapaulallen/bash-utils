Clone All Repositories
======================

# Overview

This python script clones all repositories in a gitlab organization to the current working directory, organized by group.  Directories for groups are automatically created, and repositories that are already present are skipped.

# Prerequistes

- python3
- A personal access token with "api" scope for your Gitlab account.

# Usage

```
python3 ./gitlab-clone-all.py gitlab.my-domain.io my-fancy-token
```

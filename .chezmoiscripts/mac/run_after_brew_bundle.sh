#!/bin/bash

# Brewfile hash: {{ include "Brewfile.tmpl" | sha256sum }}

brew bundle -q

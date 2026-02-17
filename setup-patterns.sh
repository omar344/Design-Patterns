#!/bin/bash

# Design Patterns Environment Setup Script
# Creates a complete .NET 10 solution with all 23 GoF design patterns

set -e

WORKSPACE="$(pwd)"

echo "Setting up Design Patterns workspace..."

# Create solution
echo "Creating solution..."
dotnet new sln -n DesignPatterns --force

# Define patterns by category
CREATIONAL=("Singleton" "Factory" "AbstractFactory" "Builder" "Prototype")
STRUCTURAL=("Adapter" "Bridge" "Composite" "Decorator" "Facade" "Flyweight" "Proxy")
BEHAVIORAL=("ChainOfResponsibility" "Command" "Iterator" "Mediator" "Memento" "Observer" "State" "Strategy" "TemplateMethod" "Visitor")

# Function to create a pattern project
create_pattern() {
    local category=$1
    local pattern=$2
    
    echo "  Creating $category/$pattern..."
    
    mkdir -p "$category/$pattern/UseCases"
    cd "$category/$pattern"
    
    dotnet new console -n "$pattern" --force --use-program-main -o .
    
    cd "$WORKSPACE"
    dotnet sln add "$category/$pattern/$pattern.csproj"
}

# Create Creational patterns
echo ""
echo "Creating Creational Patterns..."
mkdir -p Creational
for pattern in "${CREATIONAL[@]}"; do
    create_pattern "Creational" "$pattern"
done

# Create Structural patterns
echo ""
echo "Creating Structural Patterns..."
mkdir -p Structural
for pattern in "${STRUCTURAL[@]}"; do
    create_pattern "Structural" "$pattern"
done

# Create Behavioral patterns
echo ""
echo "Creating Behavioral Patterns..."
mkdir -p Behavioral
for pattern in "${BEHAVIORAL[@]}"; do
    create_pattern "Behavioral" "$pattern"
done

# Create Common library
echo ""
echo "Creating Common library..."
mkdir -p Common
cd Common
dotnet new classlib -n Common --force -o .
cd "$WORKSPACE"
dotnet sln add Common/Common.csproj

echo ""
echo "Setup complete!"
echo ""
echo "Summary:"
echo "   - Solution: DesignPatterns.sln"
echo "   - Creational patterns: ${#CREATIONAL[@]}"
echo "   - Structural patterns: ${#STRUCTURAL[@]}"
echo "   - Behavioral patterns: ${#BEHAVIORAL[@]}"
echo "   - Total projects: $((${#CREATIONAL[@]} + ${#STRUCTURAL[@]} + ${#BEHAVIORAL[@]} + 1))"
echo ""
echo "To get started:"
echo "   cd Creational/Singleton"
echo "   dotnet run"

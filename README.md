# Design Patterns in C#

Implementations of 22 of the 23 classic Gang of Four (GoF) design patterns in modern C#, organized by category. Each pattern is its own runnable project with a `Program.cs` demonstrating it. (Interpreter is the one GoF pattern not yet implemented.)

## Categories

### Creational (5)

- **AbstractFactory**: create families of related objects without specifying their concrete classes
- **Builder**: construct complex objects step by step
- **Factory**: define an interface for creating objects, let subclasses decide which class to instantiate
- **Prototype**: clone objects instead of creating new instances
- **Singleton**: ensure a class has only one instance with a global access point

### Structural (7)

- **Adapter**: make incompatible interfaces work together
- **Bridge**: decouple an abstraction from its implementation
- **Composite**: treat individual objects and compositions uniformly
- **Decorator**: add responsibilities to objects dynamically
- **Facade**: provide a simplified interface to a complex subsystem
- **Flyweight**: share common state to support large numbers of fine-grained objects
- **Proxy**: control access to an object through a surrogate

### Behavioral (10)

- **ChainOfResponsibility**: pass a request along a chain of handlers
- **Command**: encapsulate a request as an object
- **Iterator**: access elements of a collection sequentially without exposing its representation
- **Mediator**: centralize communication between objects
- **Memento**: capture and restore an object's internal state
- **Observer**: notify dependent objects of state changes
- **State**: alter behavior when an object's internal state changes
- **Strategy**: define a family of interchangeable algorithms
- **TemplateMethod**: define the skeleton of an algorithm, letting subclasses override steps
- **Visitor**: add new operations to an object structure without modifying it

## Repository Layout

```
DesignPatterns.sln
├── Creational/   # AbstractFactory, Builder, Factory, Prototype, Singleton
├── Structural/   # Adapter, Bridge, Composite, Decorator, Facade, Flyweight, Proxy
├── Behavioral/   # ChainOfResponsibility, Command, Iterator, Mediator, Memento,
│                 # Observer, State, Strategy, TemplateMethod, Visitor
└── Common/       # Shared code used across patterns
```

## Running a Pattern

Each pattern is its own project in the solution, for example:

```bash
dotnet run --project Creational/Singleton
```

## License

MIT, see [LICENSE](LICENSE).

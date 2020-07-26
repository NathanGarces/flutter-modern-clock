# flutter_modern_clock

The clock is a modern analog and digital clock, which was designed for a 900x600 smart clock.

The clock was designed using Figma and implemented in Flutter.

## A look into the code
The project follows an Mvvm architecture, which was implemented using the stacked package. There is a single main_view and main_viewmodel which shows the clock widget and the digital clock background.
The clock and all of its components were created using CustomPaint and every element of it can be customized, from size to color. I made the clock components extremely modular to make this process easier.

## The clock components
There are 4 layers to the clock:
- clock.dart, which is the clock itself and all of the components put together.
- clock_centre_circle.dart, which is the centre circle of the clock and a shadow underneath.
- clock_face.dart, which is the main "ring" or clock face.
- clock_hands.dart, which is the 3 hands of the clock and contains all of the main positional calculations.

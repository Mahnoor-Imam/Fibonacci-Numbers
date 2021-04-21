# Dynamic Route Planner using A* search algorithm

This is a console based simulation of A* implemented in C++.

# Implementation
The code operated on a 2D grid with 3 configurations to choose from namely 40x40, 60x60 and 80x80. Initially it asks for user input regarding
coordinates of start and end nodes for which boundary checks are added. User can also enter the number of walls/obstacles in the grid which
will be generated randomly. Each cell in the grid has one of the 3 values:
1) "." indicating empty cell
2) "x" indicating a wall
3) "|" indicating path

The algorithms uses diagonal and manhattan distance metric for heuristic and involves examination of diagonal cells/nodes by default to get the path.
If path is not found it shows an error saying so else, it prints the path length and grid showing the path.

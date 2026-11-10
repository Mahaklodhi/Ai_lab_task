
# AI Lab Test 

## 1. Water Jug Problem

### Aim
To solve the Water Jug Problem using BFS.

### Algorithm
Breadth First Search (BFS) is used to find the solution by exploring different states.

### Input
The user enters:
- Capacity of Jug 1
- Capacity of Jug 2
- Target amount of water

### Explanation
First, both jugs are empty. The program tries different operations like filling, emptying and transferring water between jugs.

It uses a queue to find the solution and prints every step with its step number.

### Output
The program displays each step, total steps and final answer.

## 2. Missionaries and Cannibals Problem

### Aim
To solve the Missionaries and Cannibals Problem using BFS.

### Algorithm
BFS is used to find a safe way to move everyone across the river.

### Explanation
There are 3 missionaries and 3 cannibals. The boat can carry one or two people at a time.

Missionaries should never be outnumbered by cannibals on either side of the river when missionaries are present.

The program checks all possible moves and finds a safe solution.

### Output
The program displays each step, boat position and total crossings.

## 3. Sudoku Solver

### Aim
To solve a 9×9 Sudoku puzzle using Backtracking.

### Algorithm
Backtracking is used to fill empty cells with valid numbers.

### Explanation
The Sudoku grid contains numbers from 1 to 9. No number should be repeated in any row, column or 3×3 subgrid.

The program finds an empty cell and tries different numbers. If a number is not suitable, it goes back and tries another number.

Use 0 for empty cells.

### Output
The program displays the completed Sudoku grid.

## Conclusion

In this lab, I learned about BFS and Backtracking. I also learned how to solve different AI problems using Python.

## How to Run

Use these commands to run the programs.

```bash
python water_jug.py
python missionaries_cannibals.py
python sudoku.py
```

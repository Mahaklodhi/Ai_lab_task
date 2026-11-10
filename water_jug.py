
from collections import deque
from math import gcd

jug1 = int(input("Enter capacity of Jug 1: "))
jug2 = int(input("Enter capacity of Jug 2: "))
target = int(input("Enter target amount: "))

def water_jug(a, b, target):
    queue = deque([(0, 0)])
    visited = {(0, 0)}
    parent = {(0, 0): None}

    while queue:
        x, y = queue.popleft()

        if x == target or y == target:
            path = []
            state = (x, y)

            while state is not None:
                path.append(state)
                state = parent[state]

            path.reverse()

            print("\nSolution found!")
            for i, step in enumerate(path):
                print("Step", i, ":", step)

            print("Total steps:", len(path) - 1)
            print("Final answer:", (x, y))
            return

        states = [
            (a, y),
            (x, b),
            (0, y),
            (x, 0),
            (x - min(x, b - y), y + min(x, b - y)),
            (x + min(y, a - x), y - min(y, a - x))
        ]

        for state in states:
            if state not in visited:
                visited.add(state)
                parent[state] = (x, y)
                queue.append(state)

    print("No solution possible")

if jug1 <= 0 or jug2 <= 0 or target < 0:
    print("Please enter valid capacities and target.")
elif target > max(jug1, jug2):
    print("Target cannot be greater than both jug capacities.")
elif target != 0 and target % gcd(jug1, jug2) != 0:
    print("No solution possible.")
else:
    water_jug(jug1, jug2, target)

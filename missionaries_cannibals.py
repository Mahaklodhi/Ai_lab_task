
from collections import deque

start = (3, 3, 0)
goal = (0, 0, 1)

moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]

def valid(m, c):
    if m < 0 or c < 0 or m > 3 or c > 3:
        return False

    if m > 0 and m < c:
        return False

    rm = 3 - m
    rc = 3 - c

    if rm > 0 and rm < rc:
        return False

    return True

queue = deque([start])
visited = {start}
parent = {start: None}

while queue:
    state = queue.popleft()

    if state == goal:
        path = []
        while state is not None:
            path.append(state)
            state = parent[state]

        path.reverse()

        for i, step in enumerate(path):
            m, c, boat = step
            side = "Right" if boat == 1 else "Left"
            print("Step", i, ":", m, "Missionaries,", c, "Cannibals, Boat:", side)

        print("Total steps:", len(path) - 1)
        break

    m, c, boat = state

    for x, y in moves:
        if boat == 0:
            new_state = (m - x, c - y, 1)
        else:
            new_state = (m + x, c + y, 0)

        if valid(new_state[0], new_state[1]) and new_state not in visited:
            visited.add(new_state)
            parent[new_state] = state
            queue.append(new_state)
else:
    print("No solution found")

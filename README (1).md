# Smart Traffic Signal Controller (Prolog)

A rule-based traffic signal controller that selects which road should receive the next green signal using emergency vehicles, waiting time, and traffic volume.

## Features
- Considers four roads (A, B, C, and D).
- Uses vehicle count, waiting time, and emergency-vehicle presence.
- Emergency vehicles receive the highest priority.
- Otherwise, calculates a score from traffic volume and waiting time.
- Handles equal scores by selecting the road with the longer waiting time; if still tied, uses alphabetical road order.
- Displays the selected road, green signal, and the reason for selection.

## Priority rules
1. A road with an emergency vehicle has priority over roads without one.
2. If multiple roads have emergency vehicles, the system compares their waiting time, then vehicle count.
3. If no emergency vehicle is present, score = (vehicle count × 2) + waiting time.
4. Higher score wins. For a tie, longer waiting time wins; if still tied, alphabetical order wins.

## Requirements
- SWI-Prolog (or another compatible Prolog interpreter)

## Run
1. Save `smart_traffic_signal.pl`.
2. Open SWI-Prolog.
3. Load the file: `['smart_traffic_signal.pl'].`
4. Run: `main.`

## Sample data
- Road A: 15 vehicles, waiting 5 minutes, no emergency vehicle
- Road B: 8 vehicles, waiting 12 minutes, ambulance present
- Road C: 25 vehicles, waiting 3 minutes, no emergency vehicle
- Road D: 5 vehicles, waiting 7 minutes, no emergency vehicle

## Expected result
Road B is selected because an ambulance is present. Emergency vehicles have the highest priority.

## Example output
```text
SMART TRAFFIC SIGNAL CONTROLLER
Selected Road: Road B
Signal: GREEN
Reason: An emergency vehicle is waiting on Road B. Emergency vehicles have the highest priority.
```

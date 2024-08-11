from sys import stdin, setrecursionlimit
from collections import deque

# Set recursion limit to avoid errors
setrecursionlimit(10**6)

depths = 0  # Global variable to store depths
memory = {}  # Global variable to store memory for dynamic programming

def upper_coast_depth(position, map_i, rows, columns):
    """
    Arguments:
    position (list): The position in the array defined as [row, column].
    map_i (list): The map represented as an array.
    rows (int): The number of rows in the map.
    columns (int): The number of columns in the map.
    Returns:
    Generates list of upper shore depths

    This function recursively calculates the depth of the upper coast by 
    scanning adjacent positions and marking visited areas on the map.
    """
    global depths
    depths[position[1]] = max(position[0] + 1, depths[position[1]])
    map_i[position[0]][position[1]] = "."
    if position[0] - 1 >= 0 and map_i[position[0] - 1][position[1]] == "#":  # Up
        upper_coast_depth([position[0] - 1, position[1]], map_i, rows, columns)
    if position[0] + 1 < rows and map_i[position[0] + 1][position[1]] == "#":  # Down
        upper_coast_depth([position[0] + 1, position[1]], map_i, rows, columns)
    if position[1] - 1 >= 0 and map_i[position[0]][position[1] - 1] == "#":  # Left
        upper_coast_depth([position[0], position[1] - 1], map_i, rows, columns)
    if position[1] + 1 < columns and map_i[position[0]][position[1] + 1] == "#":  # Right
        upper_coast_depth([position[0], position[1] + 1], map_i, rows, columns)

def lower_coast_depth(position, map_i, rows, columns):
    """
    Arguments:
    position (list): The position in the array defined as [row, column].
    map_i (list): The map represented as an array.
    rows (int): The number of rows in the map.
    columns (int): The number of columns in the map.
    Returns:
    Generates list of bottom shore depths

    This function recursively calculates the depth of the bottom coast by 
    scanning adjacent positions and marking visited areas on the map.
    """
    global depths
    depths[position[1]] = max(rows - position[0], depths[position[1]])
    map_i[position[0]][position[1]] = "."
    if position[0] - 1 >= 0 and map_i[position[0] - 1][position[1]] == "#":  # Up
        lower_coast_depth([position[0] - 1, position[1]], map_i, rows, columns)
    if position[0] + 1 < rows and map_i[position[0] + 1][position[1]] == "#":  # Down
        lower_coast_depth([position[0] + 1, position[1]], map_i, rows, columns)
    if position[1] - 1 >= 0 and map_i[position[0]][position[1] - 1] == "#":  # Left
        lower_coast_depth([position[0], position[1] - 1], map_i, rows, columns)
    if position[1] + 1 < columns and map_i[position[0]][position[1] + 1] == "#":  # Right
        lower_coast_depth([position[0], position[1] + 1], map_i, rows, columns)

def build_bridges(position, bridges, separation, upper_coast, lower_coast, rows, columns):
    """
    Arguments:
    position (int): The current position of the column.
    bridges (int): The number of bridges to build.
    spacing (int): The minimum distance between bridges.
    upper_coast (list): List of upper coast depths for each column.
    lower_coast (list): List of lower coastal depths for each column.
    rows (int): The number of rows in the map.
    columns (int): The number of columns in the map.
    Returns:
    int: The minimum cost of building bridges.

    This function uses dynamic programming to calculate the minimum 
    cost of building bridges across the given map, considering 
    limitations on the number of bridges and their spacing.
    """
    response = 0

    if (position, bridges) in memory:
        response = memory[(position, bridges)]
    else:
        if position >= columns:
            if bridges == 0:
                response = 0
            else:
                response = float("inf")
        elif bridges == 0:
            response = 0
        else:
            response = min(
                build_bridges(position + 1, bridges, separation, upper_coast, lower_coast, rows, columns),
                build_bridges(position + 1 + separation, bridges - 1, separation, upper_coast, lower_coast, rows, columns) + (rows - (lower_coast[position] + upper_coast[position]))
            )
        memory[(position, bridges)] = response
    return response

def main():
    global depths, memory
    line = stdin.readline().strip()

    while line != "":
        rows, columns = map(int, line.split())
        bridges, separation = map(int, stdin.readline().split())
        map_i = [list(stdin.readline().strip()) for _ in range(rows)]

        depths = [0 for _ in range(columns)]
        upper_coast_depth([0, 0], map_i, rows, columns)
        upper_coast = depths

        depths = [0 for _ in range(columns)]
        lower_coast_depth([rows - 1, 0], map_i, rows, columns)
        lower_coast = depths

        print(build_bridges(0, bridges, separation, upper_coast, lower_coast, rows, columns))

        memory = {}

        line = stdin.readline().strip()

main()

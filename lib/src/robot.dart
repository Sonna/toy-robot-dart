class Robot {
  Map<String, Map<String, String>> TURN = {
    "NORTH": {"LEFT": "WEST", "RIGHT": "EAST"},
    "EAST": {"LEFT": "NORTH", "RIGHT": "SOUTH"},
    "SOUTH": {"LEFT": "EAST", "RIGHT": "WEST"},
    "WEST": {"LEFT": "SOUTH", "RIGHT": "NORTH"}
  };

  Map<String, Map<Runes, int>> MOVE = {
    "NORTH": {"X": 0, "Y": 1},
    "EAST": {"X": 1, "Y": 0},
    "SOUTH": {"X": 0, "Y": -1},
    "WEST": {"X": -1, "Y": 0}
  };

  int _x = 0;
  int _y = 0;
  String _facing = "NORTH";

  int get x {
    return this._x;
  }

  void set x(int value) {
    this._x = value;
  }

  int get y {
    return this._y;
  }

  void set y(int value) {
    this._y = value;
  }

  String get facing {
    return this._facing;
  }

  void set facing(String value) {
    this._facing = value;
  }

  Robot([int x_value = 0, int y_value = 0, String facing_value = "NORTH"]) {
    this.x = x_value;
    this.y = y_value;
    this.facing = facing_value;
  }

  void report() {
    print("${x},${y},${facing}");
  }

  void left() {
    this.facing = TURN[this.facing]["LEFT"];
  }

  void right() {
    this.facing = TURN[this.facing]["RIGHT"];
  }

  void move() {
    this.x = this.x + MOVE[this.facing]["X"];
    this.y = this.y + MOVE[this.facing]["Y"];

    if (this.x < 0 || this.x > 4) {
      this.x = this.x - MOVE[this.facing]["X"];
    }
    if (this.y < 0 || this.y > 4) {
      this.y = this.y - MOVE[this.facing]["Y"];
    }
  }

  void place(String rawCoordinates) {
    List<String> coordinates = rawCoordinates.split(",");
    this.x = int.parse(coordinates[0]);
    this.y = int.parse(coordinates[1]);
    this.facing = coordinates[2];
  }
}

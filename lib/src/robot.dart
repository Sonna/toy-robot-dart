class Robot {
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
}

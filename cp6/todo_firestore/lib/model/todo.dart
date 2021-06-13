enum TodoStatus { to, doing, done }

class TodoContent {
  final String id;
  final String title;
  final String content;
  TodoStatus state;
  TodoContent({this.id, this.title, this.content, int stateNum}) {
    if (stateNum != null) {
      this.state = TodoStatus.values[stateNum];
    } else {
      this.state = TodoStatus.to;
    }
  }

  void setTo() {
    this.state = TodoStatus.to;
  }

  void setDoing() {
    this.state = TodoStatus.doing;
  }

  void setDone() {
    this.state = TodoStatus.done;
  }

  void setNextState() {
    switch (this.state) {
      case TodoStatus.to:
        setDoing();
        break;
      case TodoStatus.doing:
        setDone();
        break;
      case TodoStatus.done:
        break;
    }
  }

  bool isTo() {
    return (this.state == TodoStatus.to);
  }

  bool isDoing() {
    return this.state == TodoStatus.doing;
  }

  bool isDone() {
    return this.state == TodoStatus.done;
  }

  String getStateString() {
    switch (this.state) {
      case TodoStatus.to:
        return "To";
      case TodoStatus.doing:
        return "Doing";
      case TodoStatus.done:
        return "Done";
    }
  }

  int getTodoIndex() {
    return this.state.index;
  }

  @override
  String toString() {
    return "${this.title}, ${this.content}, ${this.state}";
  }
}

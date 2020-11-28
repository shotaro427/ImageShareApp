enum Plan {
  free,
  paid,
  premium,
}

class PlanInfo {
  PlanInfo(this._plan);

  final Plan _plan;

  int get totalPostsCount {
    if (_plan == Plan.paid) {
      return 35;
    } else if (_plan == Plan.premium) {
      return -1;
    } else {
      return 15;
    }
  }

  int get totalImagesCount {
    if (_plan == Plan.paid) {
      return 20;
    } else if (_plan == Plan.premium) {
      return -1;
    } else {
      return 7;
    }
  }

  int get totalPDFsCount {
    if (_plan == Plan.paid) {
      return 50;
    } else if (_plan == Plan.premium) {
      return -1;
    } else {
      return 15;
    }
  }

  int get totalMembersCount {
    if (_plan == Plan.free) {
      return 10;
    } else {
      return -1;
    }
  }
}

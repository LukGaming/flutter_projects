abstract class ICheckInternetConnectionService {
  Future<bool> hasConnection();
}

class CheckInternetConnectionMock implements ICheckInternetConnectionService {
  @override
  Future<bool> hasConnection() async {
    return false;
  }
}

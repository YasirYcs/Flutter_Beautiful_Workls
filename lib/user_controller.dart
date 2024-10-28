import 'package:get/get.dart';
import 'database_service.dart';
import 'user_model.dart';

class UserController extends GetxController {
  final DatabaseService _databaseService = DatabaseService.instance;

  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    _databaseService.initDatabase().then((_) => fetchUsers());
  }

  Future<void> fetchUsers() async {
    users.value = await _databaseService.getUsers();
  }

  Future<void> addUser(String name, int age) async {
    await _databaseService.insertUser(User(name: name, age: age));
    fetchUsers();
  }
}

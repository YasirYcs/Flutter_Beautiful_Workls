import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class Assignment2 extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  // Controllers for text input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX & MVVM Sqflite Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field for name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Input field for age
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            // Add User button
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final age = int.tryParse(ageController.text) ?? 0;

                if (name.isNotEmpty && age > 0) {
                  userController.addUser(name, age);
                  nameController.clear();
                  ageController.clear();
                } else {
                  Get.snackbar(
                    "Invalid Input",
                    "Please enter a valid name and age.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: const Text("Add User"),
            ),
            const SizedBox(height: 20),
            const Text(
              "User List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Display the list of users
            Expanded(
              child: Obx(() {
                if (userController.users.isEmpty) {
                  return const Center(child: Text("No users found"));
                }
                return ListView.builder(
                  itemCount: userController.users.length,
                  itemBuilder: (context, index) {
                    final user = userController.users[index];
                    return Card(
                      child: ListTile(
                        title: Text(user.name),
                        subtitle: Text('Age: ${user.age}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Optionally add delete functionality here
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

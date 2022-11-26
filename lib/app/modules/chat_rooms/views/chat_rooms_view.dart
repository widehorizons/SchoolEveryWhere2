import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_drawer.dart';
import '../controllers/chat_rooms_controller.dart';

class ChatRoomsView extends GetView<ChatRoomsController> {
  const ChatRoomsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('ChatRoomsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatRoomsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

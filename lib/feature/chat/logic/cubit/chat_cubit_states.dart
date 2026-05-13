import 'package:widget_space/feature/chat/logic/data/models/message_model.dart';

abstract class ChatCubitState {}

class ChatInitialState extends ChatCubitState {}

class ChatLoadingState extends ChatCubitState {}

class ChatLoadedState extends ChatCubitState {
  final List<ChatMessage> messages;
  ChatLoadedState(this.messages);
}

class ChatErrorState extends ChatCubitState {
  final String error;
  ChatErrorState(this.error);
}

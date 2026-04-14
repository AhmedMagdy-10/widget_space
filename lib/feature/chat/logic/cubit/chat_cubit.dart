import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/chat/logic/cubit/chat_cubit_states.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatInitialState());

  void userMessage(String message, String dateTime) {}
}

import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-chat/chat-cubit-package/chat-cubit.dart';
import 'package:flutter_app_newsv1/models/social-app/Social-user-model.dart';
import 'package:flutter_app_newsv1/models/social-app/message-model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat-cubit-package/chat-states.dart';



 class SocialSignInScreen extends StatelessWidget
{
  SocialUserModel socialUserModel;

  SocialSignInScreen({
    this.socialUserModel,
  });
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if(currentUser != null){
      print("Current User Success");
    } else{
      print("Current User Is Null");
    }
    return BlocProvider(
      create: (BuildContext context) => ChatCubit()
        ..getMessages(
          receiverModel: this.socialUserModel,
        ),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                this.socialUserModel.name,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ConditionalBuilder(
                    condition: ChatCubit.get(context).messages.length > 0,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          MessageModel model = ChatCubit.get(context).messages[index];

                          if (model.senderUid == currentUser.uid)
                            return myMessage(model);

                          return otherMessage(model);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.0,
                        ),
                        itemCount: ChatCubit.get(context).messages.length,
                      ),
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ChatCubit.get(context).messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'type your message',
                            suffixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 16.0,
                              ),
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  ChatCubit.get(context).sendMessage(
                                    receiverModel: this.socialUserModel,
                                  );
                                },
                                heroTag: 'send',
                                child: Icon(
                                  Icons.send,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget myMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.teal[200],
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
          topStart: Radius.circular(16.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0,
      ),
      child: Text(
        model.message,
      ),
    ),
  );

  Widget otherMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
          topStart: Radius.circular(16.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0,
      ),
      child: Text(
        model.message,
      ),
    ),
  );
}

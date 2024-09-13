part of '../chat_page.dart';

final class _MessageTextField extends StatelessWidget {
  const _MessageTextField();

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.all(PaddingConstants.small.value),
      child: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 120),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: chatCubit.messageTextField,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 12, right: 12, top: 5, bottom: 5)),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.black26),
                onPressed: chatCubit.sendMessage,
                icon: const Icon(Icons.send),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

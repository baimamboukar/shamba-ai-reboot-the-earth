import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/app/assets.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/widgetx.dart';

const gemeni_key = 'AIzaSyDncmws8YAjCvUDZfIPKcQVYXOC2j8J7kw';

//TODO: #38 Implement Records feature
@RoutePage()
class IntelliRecords extends StatefulWidget {
  const IntelliRecords({super.key});

  @override
  State<IntelliRecords> createState() => _IntelliRecordsState();
}

class _IntelliRecordsState extends State<IntelliRecords> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask to Alora'),
      ),
      body: const ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  static const _apiKey = 'AIzaSyAOazyRTYmqSQFWCR0AltY7B_HuepbGXQo';
  //'AIzaSyDncmws8YAjCvUDZfIPKcQVYXOC2j8J7kw';
  //String.fromEnvironment('API_KEY');
  final prompt =
      "Your name is Alora and your work is to assist Rwamdam farmers seeking AI assistance to improve their farm using climate-smart techniques and data-driven decisions. Please help them by acknowledging their goals, offering insights into agricultural challenges and opportunities, discussing climate-smart practices, and emphasizing data-driven approaches for yield, sustainability, and climate adaptation. They are especially interested in your expertise in soil, crop selection, water management, pest control, and market access. Feel free to ask clarifying questions, and I look forward to tailored responses that consider my specific context. Let's work together for a flourishing farm!";
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: gemeni_key,
      generationConfig: GenerationConfig(
        maxOutputTokens: 250,
      ),
    );
    _chat = _model.startChat();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      suffixIcon: IconButton(
        onPressed: () async {
          _sendChatMessage(_textController.text);
        },
        icon: Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      prefixIcon: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colorScheme.primaryContainer,
        ),
        child: const HeroIcon(
          HeroIcons.microphone,
          size: 22,
        ),
      ).hPaddingx(4),
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Ask something...?',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _apiKey.isNotEmpty
                ? ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
                      final content = _chat.history.toList()[idx];
                      final text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join();
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    },
                    itemCount: _chat.history.length,
                  )
                : ListView(
                    children: const [
                      Text('No API key found. Please provide an API Key.'),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Visibility(
                  visible: false,
                  child: Image.asset(
                    Assets.assetsIconsIntellibra,
                    height: 100,
                  ).floatL,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        focusNode: _textFieldFocus,
                        decoration: textFieldDecoration,
                        controller: _textController,
                        onSubmitted: (String value) {
                          if (value.isNotEmpty && !_loading)
                            _sendChatMessage(value);
                        },
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 10,
                    ),
                    if (!_loading)
                      IconButton(
                        onPressed: () async {
                          _sendChatMessage(_textController.text);
                        },
                        icon: HeroIcon(
                          HeroIcons.paperAirplane,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    else
                      const CircularProgressIndicator(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await _chat.sendMessage(
        Content.text(message),
      );
      final text = response.text;

      if (text == null) {
        _showError('Something went wrong..!');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    required this.text,
    required this.isFromUser,
    super.key,
  });
  final String text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? context.scheme.primaryContainer
                  : context.scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
            ),
          ),
        ),
      ],
    );
  }
}

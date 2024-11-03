import 'package:example/multiple_view_models_example/multiple_view_models_example.dart';
import 'package:example/post_frame_callback_example/post_frame_callback_example.dart';
import 'package:example/responsive_example/responsive_example.dart';
import 'package:flutter/material.dart';

final _moreExamples = {
  "Multiple ViewModels Example": const MultipleViewModelsExample(),
  "PostFrameCallback Example": const PostFrameCallbackExample(),
  "Responsive Example": const ResponsiveExample(),
};

class MoreExamplesSection extends StatelessWidget {
  const MoreExamplesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'More Examples',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Wrap(
              spacing: 10,
              runSpacing: 6,
              children: _moreExamples.entries
                  .map((entry) => ElevatedButton(
                      style: ButtonStyle(
                          elevation: WidgetStateProperty.all(0),
                          backgroundColor:
                              WidgetStateProperty.all(Colors.blue.shade50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => entry.value));
                      },
                      child: Text(entry.key)))
                  .toList()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GithubButtonWidget extends StatefulWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;

  const GithubButtonWidget({
    Key? key,
    required this.title,
    this.isLoading = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<GithubButtonWidget> createState() => _GithubButtonWidgetState();
}

class _GithubButtonWidgetState extends State<GithubButtonWidget> {
  final isPressed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: widget.onPressed != null
            ? Colors.white
            : Colors.white.withOpacity(.2),
      ),
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 400),
          minimumSize: MaterialStateProperty.all(
            const Size(double.maxFinite, 56),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(500),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed) != isPressed.value) {
              isPressed.value = states.contains(MaterialState.pressed);
            }

            if (states.contains(MaterialState.pressed)) {
              return Colors.white.withOpacity(.5);
            }

            return Colors.transparent;
          }),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: widget.isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              )
            : Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
      ),
    );
  }
}

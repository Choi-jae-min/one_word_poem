import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatefulWidget {
  final String hintText;
  final String textTitle;
  final int maxLength;
  final TextEditingController controller;

  const DefaultTextField({super.key,
    required this.textTitle,
    required this.hintText,
    required this.maxLength,
    required this.controller,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(widget.textTitle),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: widget.controller,
                builder: (context,value,child){
                  return TextField(
                      controller: widget.controller,
                      cursorHeight: 14,
                      maxLength: widget.maxLength,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[\r\n]')),
                        LengthLimitingTextInputFormatter(
                            widget.maxLength,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced
                        ),
                      ],
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 2,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF493326),
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: widget.hintText,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9B948C),
                        ),

                        suffixIcon: IgnorePointer(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Center(
                              widthFactor: 1,
                              child: Text(
                                '${value.text.characters.length} / ${widget.maxLength}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6E6257),
                                ),
                              ),
                            ),
                          ),
                        ),

                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFD8CFC3),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF9B948C),
                            width: 1.5,
                          ),
                        ),
                      )
                  );
                },
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                width: 50,
                'assets/articles/pencil_curve.png',
              )
          ),
        ],
      )
    );
  }
}

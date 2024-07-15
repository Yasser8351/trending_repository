import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({super.key, required this.errorMessage,  this.onPressed});
  final String  errorMessage;
  final Function()? onPressed ;

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return   Center(child: Column(
                          children: [
                            SizedBox(height: size.height/3),
                            Text(errorMessage.toString()), 
                          ],
                        ),
                        );
  }
}

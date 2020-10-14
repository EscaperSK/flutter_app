import 'package:flutter/material.dart';

class IconWithBadgeStless extends StatelessWidget {
  IconWithBadgeStless(this.icon, this.amount, {Key key}) : super(key: key);
  final IconData icon;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Icon(icon),
                amount > 0
                    ? Positioned(
                        left: 13,
                        top: -5.0,
                        child: Container(
                          height: 22,
                          constraints: BoxConstraints(minWidth: 22),
                          decoration: BoxDecoration(
                            color: Color(0xffFA431C),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Center(
                            widthFactor: 1.3,
                            child: Text(
                              '${amount < 100 ? amount : '99+'}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

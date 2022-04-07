import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeBallJump extends StatefulWidget {
  final void Function(Offset?)? onTap;
  const PokeBallJump({Key? key, this.onTap}) : super(key: key);

  @override
  State<PokeBallJump> createState() => _PokeBallJumpState();
}

class _PokeBallJumpState extends State<PokeBallJump>
    with TickerProviderStateMixin {
  late AnimationController bouncingController;
  late Animation bouncingAnimation;

  @override
  void initState() {
    bouncingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    bouncingAnimation =
        Tween(begin: const Offset(0, 0.0), end: const Offset(0, 40.0)).animate(
            CurvedAnimation(
                parent: bouncingController, curve: Curves.elasticOut));
    bouncingController.addListener(() => setState(() {}));
    bouncingController.repeat(reverse: true);
    // bouncingController.forward();

    super.initState();
  }

  @override
  void dispose() {
    bouncingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      // color: Colors.red,
      margin: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.topCenter,
      child: Transform.translate(
        offset: bouncingAnimation.value,
        child: GestureDetector(
          onTap: () => widget.onTap!(bouncingAnimation.value),
          child: SvgPicture.network(
            "https://pokebag.vercel.app/static/media/pokeball.b680bb83.svg",
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}

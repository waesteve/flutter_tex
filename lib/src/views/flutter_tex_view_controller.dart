import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/src/views/mobile_tex_view.dart'
    if (dart.library.html) 'package:flutter_tex/src/web_tex_view.dart'
    as teXView;
import 'package:flutter_tex/src/utils/tex_view_child.dart';

/// TeX Rendering Engine, Katex for fast rendering, Mathjax for quality render.
enum RenderingEngine { MathJax, Katex }

///A Flutter Widget to render Mathematics / Maths, Physics and Chemistry, Statistics / Stats Equations based on LaTeX with full HTML and JavaScript support.
///
///
class TeXView extends StatelessWidget {
  final Key key;

  ///Raw String containing HTML and TEX Code e.g. String textHTML = r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """
  @deprecated
  final String teXHTML;

  @required
  final List<TeXViewChild> children;

  /// Style TeXView Widget with CSS code.
  final String style;

  /// Render Engine to render TeX.
  final RenderingEngine renderingEngine;

  /// Fixed Height for TeXView. (Avoid using fixed height for TeXView, let it to adopt the height by itself)
  final double height;

  /// Show a loading widget before rendering completes.
  final Widget loadingWidget;

  /// On Tap Callback.
  final Function(String childID) onTap;

  /// Callback when TEX rendering finishes.
  final Function(double height) onRenderFinished;

  /// Callback when TeXView loading finishes.
  final Function(String message) onPageFinished;

  /// Keep widget Alive. (True by default).
  final bool keepAlive;

  TeXView(
      {this.key,
      this.teXHTML,
      this.children,
      this.style,
      this.height,
      this.loadingWidget,
      this.onTap,
      this.keepAlive,
      this.onRenderFinished,
      this.onPageFinished,
      this.renderingEngine});

  @override
  Widget build(BuildContext context) {
    return teXView.TeXView(
        height: this.height,
        loadingWidget: this.loadingWidget,
        keepAlive: this.keepAlive,
        key: this.key,
        onTap: this.onTap,
        onPageFinished: this.onPageFinished,
        onRenderFinished: this.onRenderFinished,
        children: this.children,
        style: this.style,
        renderingEngine: this.renderingEngine);
  }
}
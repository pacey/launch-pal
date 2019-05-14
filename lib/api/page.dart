import 'package:flutter/foundation.dart';

class Page extends Diagnosticable {
  final int offset;
  final int count;
  final int total;

  Page(this.offset, this.count, this.total);
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextStyle? h11bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h1bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h2bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h3bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h4bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h5bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w700, color: color);
  static TextStyle? h6bold({required Color color}) => GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w700, color: color);

  static TextStyle? h1semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w600, color: color);
  static TextStyle? h2semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: color);
  static TextStyle? h3semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: color);
  static TextStyle? h4semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: color);
  static TextStyle? h5semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w600, color: color);
  static TextStyle? h6semi({required Color color}) => GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: color);

  static TextStyle? h1reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 22, color: color);
  static TextStyle? h2reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 20, color: color);
  static TextStyle? h3reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 18, color: color);
  static TextStyle? h4reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 16, color: color);
  static TextStyle? h5reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 15, color: color);
  static TextStyle? h6reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 14, color: color);
  static TextStyle? h7reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 13, color: color);
  static TextStyle? h8reg({required Color color}) =>
      GoogleFonts.poppins(fontSize: 12, color: color);
}

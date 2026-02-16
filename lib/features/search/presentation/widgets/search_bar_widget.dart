import 'package:cineverse/features/search/presentation/bloc/search_bloc.dart';
import 'package:cineverse/features/search/presentation/bloc/search_event.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controller,
        style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          hintText: l10n.searchHint,
          hintStyle: GoogleFonts.outfit(color: Colors.grey, fontSize: 16),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
            size: 20,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    context.read<SearchBloc>().add(
                      const SearchQueryChanged(''),
                    );
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        ),
        onChanged: (query) {
          setState(() {});
          context.read<SearchBloc>().add(SearchQueryChanged(query));
        },
      ),
    );
  }
}

import 'package:cineverse/features/search/presentation/bloc/search_bloc.dart';
import 'package:cineverse/features/search/presentation/bloc/search_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHistoryWidget extends StatelessWidget {
  final List<String> history;

  const SearchHistoryWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.time, size: 64, color: Color(0xFF2A2A2A)),
            const SizedBox(height: 16),
            Text(
              'No recent searches',
              style: GoogleFonts.outfit(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Recent Searches',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final query = history[index];
              return ListTile(
                leading: const Icon(CupertinoIcons.time, color: Colors.grey),
                title: Text(
                  query,
                  style: GoogleFonts.outfit(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(CupertinoIcons.xmark, color: Colors.grey),
                  onPressed: () {
                    context.read<SearchBloc>().add(
                      DeleteSearchQueryEvent(query),
                    );
                  },
                ),
                onTap: () {
                  context.read<SearchBloc>().add(SearchQueryChanged(query));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

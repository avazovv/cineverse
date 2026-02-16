
part of 'watchlist_movie_model.dart';


class WatchlistMovieModelAdapter extends TypeAdapter<WatchlistMovieModel> {
  @override
  final int typeId = 0;

  @override
  WatchlistMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchlistMovieModel(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      voteAverage: fields[3] as double,
      releaseDate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WatchlistMovieModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchlistMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

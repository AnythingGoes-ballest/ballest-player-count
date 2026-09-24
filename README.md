# Player Count

A plugin for the [Ballest plugin manager](https://github.com/AnythingGoes-ballest/ballest-plugin-manager): inside a
map, the leaderboard's title shows how many players have a time on that track.

```
leaderboard · 8,221
```

The number is Steam's count of entries on the leaderboard on screen, asked again every couple of seconds, so it follows
the track you're on and new times as they come in.

## Install

In the game: footer **plugins** > **browse** > Player Count > **install**. Needs the plugin manager host 0.9.0 or
newer.

## How it works

`main.as` reads `Leaderboard::Players()` and shows it with `Leaderboard::SetTitleNote()` (the host's Leaderboard API).

## License

MIT

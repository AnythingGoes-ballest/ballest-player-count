# Player Count

A plugin for the [Ballest plugin manager](https://github.com/AnythingGoes-ballest/ballest-plugin-manager): how many
players are on a leaderboard.

- Inside a map, the leaderboard's title shows how many players have a time on that track:

  ```
  leaderboard · 8,221
  ```

- On the main menu, the overall leaderboard bar along the top shows how many players are on it:

  ```
  12,583  overall
  ```

The numbers are Steam's counts of entries on those leaderboards, asked again every couple of seconds, so they follow
the track you're on, the season and new times as they come in.

## Install

In the game: footer **plugins** > **browse** > Player Count > **install**. Needs the plugin manager host 0.22.0 or
newer.

## How it works

`main.as` reads `Leaderboard::Players()` and `Leaderboard::OverallPlayers()`, and shows them with
`Leaderboard::SetTitleNote()` and `Leaderboard::SetOverallNote()` (the host's Leaderboard API).

## License

MIT

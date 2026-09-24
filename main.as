// Player Count: inside a map, the leaderboard's title shows how many players have a time on that track:
//
//   leaderboard · 12,345
//
// (just the number: with "players" after it the title no longer fits beside the global / friends buttons)
//
// The number is Steam's entry count for the leaderboard on screen (Leaderboard::Players()), asked again every few
// seconds, so it follows the track and new times as they come in.

const double CHECK_EVERY = 2.0;       // seconds
double lastCheck = -100;
string shownNote;

// 12345 -> "12,345"
string Grouped(int n)
{
    string digits = "" + n;
    string grouped;
    for (int i = 0; i < int(digits.length()); i++)
    {
        if (i > 0 && (int(digits.length()) - i) % 3 == 0)
            grouped += ",";
        grouped += digits.substr(i, 1);
    }
    return grouped;
}

void Main()
{
    Log::Info("player count ready");
}

void Update(float dt)
{
    if (Host::Time() - lastCheck < CHECK_EVERY)
        return;
    lastCheck = Host::Time();
    int players = Leaderboard::Players();
    string note = players > 0 ? "· " + Grouped(players) : "";
    if (note != shownNote)
    {
        Leaderboard::SetTitleNote(note);
        shownNote = note;
        if (note != "")
            Log::Info("leaderboard: " + Grouped(players) + " players");
    }
}

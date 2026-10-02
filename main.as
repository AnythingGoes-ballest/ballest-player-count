// Player Count: how many players are on a leaderboard.
//
//   inside a map, after the leaderboard's title:     leaderboard · 12,345
//   on the main menu, before the overall bar's label: 30,123  overall
//
// (just the number: with "players" after it the title no longer fits beside the global / friends buttons)
//
// The numbers are Steam's entry counts for those leaderboards (Leaderboard::Players(), Leaderboard::OverallPlayers()),
// asked again every few seconds, so they follow the track, the season and new times as they come in.

const double CHECK_EVERY = 2.0;       // seconds
double lastCheck = -100;
string shownNote, shownOverall;

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
    int overall = Leaderboard::OverallPlayers();
    string overallNote = overall > 0 ? Grouped(overall) : "";
    if (overallNote != shownOverall)
    {
        Leaderboard::SetOverallNote(overallNote);
        shownOverall = overallNote;
        if (overallNote != "")
            Log::Info("overall leaderboard: " + overallNote + " players");
    }
}

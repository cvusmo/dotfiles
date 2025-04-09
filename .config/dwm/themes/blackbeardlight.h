/* blackbeardlight.h */
static const char black[]       = "#1C1B1A";  // Foreground
static const char white[]       = "#F4E3C1";  // Background
static const char gray2[]       = "#7A6E57";  // Unfocused window border
static const char gray3[]       = "#614A4D";  // Bright black
static const char gray4[]       = "#454240";  // Normal black
static const char blue[]        = "#3A6A85";  // Focused window border
static const char green[]       = "#5A8C3A";
static const char red[]         = "#A61B1E";
static const char orange[]      = "#F4A259";  // Selection background
static const char yellow[]      = "#C89F27";
static const char pink[]        = "#7A4A9A";
static const char col_borderbar[] = "#F4E3C1"; // Inner border

/* Define the colors array for dwm */
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { black,      white,     gray2 },  // Normal: black text, white bg, gray2 border
    [SchemeSel]  = { black,      orange,    blue  },  // Selected: black text, orange bg, blue border
};

/* blackbeardlight.h */
static const char black[]       = "#1C1B1A";  // Foreground
static const char white[]       = "#F4E3C1";  // Background
static const char gray2[]       = "#AA9E87";  // Unfocused window border
static const char gray3[]       = "#614A4D";  // Bright black
static const char gray4[]       = "#454240";  // Normal black
static const char blue[]        = "#5A8CA5";  // Focused window border
static const char green[]       = "#88C070";
static const char red[]         = "#D13438";
static const char orange[]      = "#F4A259";  // Selection background
static const char yellow[]      = "#F1C232";
static const char pink[]        = "#A066C9";
static const char col_borderbar[] = "#F4E3C1"; // Inner border

/* Define the colors array for dwm */
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { black,     white,     gray2 },  // Normal: black text, white bg, gray2 border
    [SchemeSel]  = { black,     orange,    blue  },  // Selected: black text, orange bg, blue border
};
